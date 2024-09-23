@implementation SBMainDisplayLayoutStateManager

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isHomeScreenEntity") & 1) != 0 || (objc_msgSend(v2, "isEmptyWorkspaceEntity") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    +[SBLayoutElement elementWithDescriptor:](SBLayoutElement, "elementWithDescriptor:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainDisplayLayoutStateManager;
  -[SBLayoutStateManager layoutStateForApplicationTransitionContext:](&v4, sel_layoutStateForApplicationTransitionContext_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SBRecentAppLayouts)_recentAppLayouts
{
  void *v2;
  void *v3;

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_recentAppLayoutsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBRecentAppLayouts *)v3;
}

- (id)_layoutStateForApplicationTransitionContext:(id)a3
{
  int v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  id v33;
  id v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  void *v76;
  char v77;
  char v78;
  uint64_t v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t n;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  void *v97;
  void *v98;
  int v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  _BOOL4 IsStashed;
  int v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
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
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  uint64_t v148;
  _BOOL4 IsSplitView;
  uint64_t v150;
  uint64_t v151;
  _BOOL4 IsValid;
  uint64_t v154;
  _BOOL4 v155;
  uint64_t v156;
  char v157;
  _BOOL4 IsLeft;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  char v163;
  char v164;
  uint64_t v165;
  BOOL v166;
  uint64_t v167;
  _BOOL4 v168;
  BOOL v169;
  id v170;
  id v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  _BOOL4 v176;
  void *v177;
  uint64_t v178;
  void *v179;
  int v180;
  void *v181;
  void *v182;
  char v183;
  uint64_t v184;
  void *v185;
  void *v186;
  int v187;
  _BOOL4 v188;
  _BOOL4 v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  void *v194;
  void *v195;
  void *v196;
  id v197;
  void *v198;
  void *v199;
  uint64_t v200;
  unint64_t v201;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  BOOL v205;
  int v206;
  id v207;
  void *v208;
  void *v209;
  id v210;
  void *v211;
  void *v212;
  uint64_t v213;
  void *v214;
  id v215;
  uint64_t v216;
  void *v217;
  uint64_t v218;
  void *v219;
  void *v220;
  SBDisplayItemLayoutAttributes *v221;
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
  uint64_t v232;
  SBDisplayItemLayoutAttributes *v233;
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
  BOOL v244;
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
  unint64_t v256;
  double v257;
  double v258;
  double v259;
  double v260;
  char v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  void *v267;
  unint64_t v268;
  void *v269;
  void *v270;
  void *v271;
  id v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t ii;
  void *v277;
  void *v278;
  id v279;
  void *v280;
  id v281;
  void *v282;
  void *v283;
  id v284;
  void *v285;
  void *v286;
  id v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t jj;
  void *v295;
  void *v296;
  uint64_t v297;
  SBMainDisplayLayoutState *v298;
  uint64_t v299;
  NSObject *v300;
  id v301;
  void *v302;
  void *v303;
  void *v304;
  unint64_t v305;
  void *v306;
  unsigned int v307;
  uint64_t v308;
  void *v309;
  uint64_t v310;
  uint64_t kk;
  uint64_t v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  uint64_t v322;
  double v323;
  double v324;
  double v325;
  double v326;
  double v327;
  double v328;
  int v329;
  id v330;
  uint64_t v331;
  uint64_t v332;
  id v333;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  BOOL v339;
  void *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t k;
  uint64_t v344;
  void *v345;
  void *v346;
  void *v347;
  int v348;
  void *v349;
  void *v350;
  uint64_t v351;
  int v352;
  int v353;
  void *v354;
  void *v355;
  void *v356;
  id v357;
  id v358;
  uint64_t v359;
  id v360;
  id v361;
  id v362;
  id v363;
  char v364;
  char v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  int v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  int v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t m;
  void *v391;
  void *v392;
  char v393;
  id v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  uint64_t v434;
  id v435;
  unsigned int IsYes;
  void *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  id v441;
  uint64_t v442;
  void *v443;
  void (**v444)(_QWORD, _QWORD, _QWORD);
  id v445;
  id v446;
  SBDisplayItemLayoutAttributes *v447;
  id v448;
  id v449;
  uint64_t v450;
  id v451;
  void *v452;
  void *v453;
  id v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  void *v458;
  void *v459;
  uint64_t v460;
  uint64_t v461;
  void *v462;
  id v463;
  uint64_t v464;
  id v465;
  id v466;
  id v467;
  void *v468;
  void *v469;
  id v470;
  id v471;
  id v472;
  void *v473;
  uint64_t v474;
  uint64_t v475;
  id v477;
  SBDisplayItemLayoutAttributesCalculator *v478;
  id v479;
  void *v480;
  void *v481;
  id objc;
  id obja;
  id objb;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  void *v489;
  SBMainDisplayLayoutState *v490;
  id v491;
  id v492;
  uint64_t v493;
  void *v494;
  void *v495;
  uint64_t v496;
  id v497;
  uint64_t v498;
  _OWORD v499[3];
  uint64_t v500;
  char v501[56];
  __int128 v502;
  __int128 v503;
  __int128 v504;
  __int128 v505;
  id v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  _QWORD v511[4];
  id v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  _QWORD v517[4];
  id v518;
  _QWORD v519[4];
  id v520;
  _QWORD v521[4];
  id v522;
  _QWORD v523[4];
  id v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  _QWORD v529[4];
  id v530;
  _BYTE v531[56];
  __int128 v532;
  __int128 v533;
  __int128 v534;
  uint64_t v535;
  _OWORD v536[3];
  uint64_t v537;
  _BYTE v538[56];
  _OWORD v539[3];
  uint64_t v540;
  _QWORD v541[4];
  SBDisplayItemLayoutAttributes *v542;
  _QWORD v543[4];
  SBDisplayItemLayoutAttributes *v544;
  _QWORD v545[5];
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  _QWORD v550[4];
  id v551;
  id v552;
  id v553;
  id v554;
  id v555;
  id v556;
  void (**v557)(_QWORD, _QWORD, _QWORD);
  id v558;
  uint8_t *v559;
  _QWORD v560[4];
  id v561;
  id v562;
  __int128 *v563;
  _QWORD v564[4];
  id v565;
  _QWORD *v566;
  uint8_t *v567;
  _QWORD v568[4];
  _QWORD v569[4];
  id v570;
  _QWORD v571[4];
  id v572;
  uint8_t *v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  _QWORD v590[4];
  id v591;
  uint8_t *v592;
  _QWORD v593[4];
  id v594;
  id v595;
  SBMainDisplayLayoutStateManager *v596;
  id v597;
  id v598;
  SEL v599;
  _QWORD v600[4];
  id v601;
  id v602;
  id v603;
  id v604;
  id v605;
  _BYTE v606[128];
  _BYTE v607[128];
  _BYTE v608[5];
  uint8_t v609[128];
  uint8_t buf[16];
  __int128 v611;
  __int128 v612;
  uint64_t v613;
  _BYTE v614[128];
  _BYTE v615[128];
  _BYTE v616[128];
  _BYTE v617[128];
  _BYTE v618[128];
  uint64_t v619;

  v619 = *MEMORY[0x1E0C80C00];
  v479 = a3;
  objc_msgSend(v479, "request");
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  v474 = objc_msgSend(v468, "source");
  objc_msgSend(v479, "previousLayoutState");
  v473 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v468, "displayIdentity");
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainDisplayLayoutStateManager _switcherControllerForDisplayIdentity:](self, "_switcherControllerForDisplayIdentity:", v459);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v479, "isBackground");
  if ((v3 & 1) != 0 || v474 == 14)
  {
    if (v3)
    {
      objc_msgSend(v479, "applicationSceneEntityForLayoutRole:", 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v497 = v473;
      if (v19)
      {
        objc_msgSend(v19, "activationSettings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "_settingsAreValidToMoveContentToNewScene"))
        {
          v490 = [SBMainDisplayLayoutState alloc];
          objc_msgSend(v497, "elements");
          v494 = (void *)objc_claimAutoreleasedReturnValue();
          v487 = objc_msgSend(v497, "spaceConfiguration");
          objc_msgSend(v497, "elementIdentifiersToLayoutAttributes");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc = (id)objc_msgSend(v497, "floatingConfiguration");
          v22 = objc_msgSend(v497, "unlockedEnvironmentMode");
          v23 = objc_msgSend(v497, "isFloatingSwitcherVisible");
          v24 = objc_msgSend(v497, "peekConfiguration");
          objc_msgSend(v497, "bundleIDShowingAppExpose");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v497, "windowPickerRole");
          v27 = objc_msgSend(v497, "displayOrdinal");
          LOBYTE(v428) = objc_msgSend(v497, "isDisplayExternal");
          LOBYTE(v427) = 1;
          v28 = -[SBMainDisplayLayoutState _initWithLayoutElements:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:](v490, "_initWithLayoutElements:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:", v494, v487, v21, objc, v22, v23, 1, v427, v24, v25, v26, v27, v428);

          v497 = (id)v28;
        }

      }
    }
    else if (v474 == 14)
    {
      v497 = -[SBMainDisplayLayoutState _initWithLayoutState:]([SBMainDisplayLayoutState alloc], "_initWithLayoutState:", v473);
      v507 = 0u;
      v508 = 0u;
      v509 = 0u;
      v510 = 0u;
      objc_msgSend(v479, "previousEntities");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v507, v607, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v508;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v508 != v31)
              objc_enumerationMutation(v29);
            objc_msgSend(v479, "setEntity:forLayoutRole:", *(_QWORD *)(*((_QWORD *)&v507 + 1) + 8 * i), objc_msgSend(*(id *)(*((_QWORD *)&v507 + 1) + 8 * i), "layoutRole"));
          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v507, v607, 16);
        }
        while (v30);
      }

    }
    else
    {
      v497 = 0;
    }
    goto LABEL_544;
  }
  objc_msgSend(v468, "displayIdentity");
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainDisplayLayoutStateManager _mainWorkspace](self, "_mainWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMedusaCapable");

  v475 = objc_msgSend(v469, "windowManagementStyle");
  objc_msgSend(v479, "activatingEntity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v479, "entityForLayoutRole:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v479, "entityForLayoutRole:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v479, "entityForLayoutRole:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v479, "entityForLayoutRole:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && v7 && !v8 && !v9)
  {
    v6 = v7;

    v7 = 0;
  }
  v454 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v486 = objc_msgSend(v479, "requestedSpaceConfiguration");
  v457 = objc_msgSend(v479, "requestedCenterConfiguration");
  v450 = objc_msgSend(v479, "requestedFloatingConfiguration");
  v15 = objc_msgSend(v479, "requestedPeekConfiguration");
  v493 = objc_msgSend(v479, "requestedUnlockedEnvironmentMode");
  objc_msgSend(v479, "requestedFloatingSwitcherVisible");
  objc_msgSend(v479, "requestedCenterEntityModal");
  objc_msgSend(v479, "requestedAppExposeBundleID");
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  v455 = objc_msgSend(v479, "requestedWindowPickerRole");
  objc_msgSend(v479, "previousEntityForLayoutRole:", 1);
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v479, "previousEntityForLayoutRole:", 2);
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v479, "previousEntityForLayoutRole:", 3);
  v433 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v479, "previousEntityForLayoutRole:", 4);
  v431 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v473, "interfaceOrientation");
  v440 = objc_msgSend(v473, "spaceConfiguration");
  v460 = objc_msgSend(v473, "floatingConfiguration");
  v438 = objc_msgSend(v473, "centerConfiguration");
  v17 = objc_msgSend(v473, "peekConfiguration");
  v18 = objc_msgSend(v473, "unlockedEnvironmentMode");
  v600[0] = MEMORY[0x1E0C809B0];
  v600[1] = 3221225472;
  v600[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2;
  v600[3] = &unk_1E8EB1BE8;
  v477 = v479;
  v601 = v477;
  v448 = v11;
  v602 = v448;
  v446 = v12;
  v603 = v446;
  v449 = v13;
  v604 = v449;
  v445 = v14;
  v605 = v445;
  v444 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v600);
  if (v5)
  {
    v464 = objc_msgSend(v469, "windowManagementStyle");
    if (v448 || v446 || v449 || v445)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v448)
      {
        objc_msgSend(v448, "uniqueIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v470 = v448;
        if (v39)
        {
          objc_msgSend(v448, "uniqueIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v40);

          v470 = v448;
        }
      }
      else
      {
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v470 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v446)
      {
        objc_msgSend(v446, "uniqueIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v435 = v446;
        if (v43)
        {
          objc_msgSend(v446, "uniqueIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v44);

          v435 = v446;
        }
      }
      else
      {
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v435 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v449)
      {
        objc_msgSend(v449, "uniqueIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = (uint64_t)v449;
        if (v45)
        {
          objc_msgSend(v449, "uniqueIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v47);

          v46 = (uint64_t)v449;
        }
      }
      else
      {
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v46 = objc_claimAutoreleasedReturnValue();
      }
      v466 = (id)v46;
      if (v445)
      {
        objc_msgSend(v445, "uniqueIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v472 = v445;
        if (v48)
        {
          objc_msgSend(v445, "uniqueIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "addObject:", v49);

          v472 = v445;
        }
      }
      else
      {
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v472 = (id)objc_claimAutoreleasedReturnValue();
      }
      if ((unint64_t)objc_msgSend(v38, "count") >= 2 && !v486)
      {
        -[SBMainDisplayLayoutStateManager _mostRecentAppLayoutMatchingAnyUniqueIdentifier:chamoisWindowingUIEnabled:multitaskingSupported:](self, "_mostRecentAppLayoutMatchingAnyUniqueIdentifier:chamoisWindowingUIEnabled:multitaskingSupported:", v38, v475 == 2, v475 != 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v50;
        if (v50)
        {
          v52 = objc_msgSend(v50, "configuration");
          if ((unint64_t)(v52 - 2) >= 3)
            v53 = 0;
          else
            v53 = v52;
          v486 = v53;
        }
        else
        {
          v486 = 0;
        }

      }
    }
    else if (v454)
    {
      if (objc_msgSend(v454, "isHomeScreenEntity"))
      {
        v470 = v454;
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v435 = (id)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v466 = (id)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v472 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if (SBWorkspaceEntitiesAreAnalagous(v454, v433)
             && (objc_msgSend(v454, "isEmptyWorkspaceEntity") & 1) == 0)
      {
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v470 = (id)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v435 = (id)objc_claimAutoreleasedReturnValue();
        v466 = v454;
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v472 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if (SBWorkspaceEntitiesAreAnalagous(v454, v437)
             && (objc_msgSend(v454, "isEmptyWorkspaceEntity") & 1) == 0)
      {
        v470 = v454;
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v435 = (id)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v466 = (id)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v472 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if (SBWorkspaceEntitiesAreAnalagous(v454, v432)
             && (objc_msgSend(v454, "isEmptyWorkspaceEntity") & 1) == 0)
      {
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v470 = (id)objc_claimAutoreleasedReturnValue();
        v435 = v454;
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v466 = (id)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v472 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if (SBWorkspaceEntitiesAreAnalagous(v454, v431)
             && (objc_msgSend(v454, "isEmptyWorkspaceEntity") & 1) == 0)
      {
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v470 = (id)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v435 = (id)objc_claimAutoreleasedReturnValue();
        +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
        v466 = (id)objc_claimAutoreleasedReturnValue();
        v472 = v454;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v452 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v454, "uniqueIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          objc_msgSend(v454, "uniqueIdentifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v452, "addObject:", v55);

        }
        -[SBMainDisplayLayoutStateManager _mostRecentAppLayoutMatchingAnyUniqueIdentifier:chamoisWindowingUIEnabled:multitaskingSupported:](self, "_mostRecentAppLayoutMatchingAnyUniqueIdentifier:chamoisWindowingUIEnabled:multitaskingSupported:", v452, v475 == 2, v475 != 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v56;
        if (v56)
        {
          if (objc_msgSend(v56, "environment") == 2 && (objc_msgSend(v437, "isHomeScreenEntity") & 1) == 0)
          {
            objc_msgSend(v57, "itemForLayoutRole:", 1);
            v344 = objc_claimAutoreleasedReturnValue();
            v345 = (void *)v344;
            if (v475 == 2)
            {
              if (!v344)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v423 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v423, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 687, CFSTR("App layout should always have primary display item!"));

              }
              objc_msgSend(v454, "uniqueIdentifier");
              v346 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v345, "uniqueIdentifier");
              v347 = (void *)objc_claimAutoreleasedReturnValue();
              v348 = objc_msgSend(v346, "isEqualToString:", v347);

              if (v348)
              {
                v470 = v454;
              }
              else
              {
                objc_msgSend(v345, "bundleIdentifier");
                v376 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v345, "uniqueIdentifier");
                v377 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBMainDisplayLayoutStateManager _applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:](self, "_applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:", v376, v377, v430);
                v470 = (id)objc_claimAutoreleasedReturnValue();

              }
              +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
              v435 = (id)objc_claimAutoreleasedReturnValue();
              +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
              v466 = (id)objc_claimAutoreleasedReturnValue();
              +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
              v472 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              if (!v344)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v424 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v424, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 701, CFSTR("App layout should always have primary display item!"));

              }
              objc_msgSend(v454, "uniqueIdentifier");
              v373 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v345, "uniqueIdentifier");
              v374 = (void *)objc_claimAutoreleasedReturnValue();
              v375 = objc_msgSend(v373, "isEqualToString:", v374);

              if (v375)
              {
                v466 = v454;
              }
              else
              {
                objc_msgSend(v345, "bundleIdentifier");
                v378 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v345, "uniqueIdentifier");
                v379 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBMainDisplayLayoutStateManager _applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:](self, "_applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:", v378, v379, v430);
                v466 = (id)objc_claimAutoreleasedReturnValue();

                if (!v466)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v425 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v425, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 707, CFSTR("Failed to create primary workspace entity from app layout's primary display item!"));

                  v466 = 0;
                }
              }
              +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
              v470 = (id)objc_claimAutoreleasedReturnValue();
              +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
              v435 = (id)objc_claimAutoreleasedReturnValue();
              +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
              v472 = (id)objc_claimAutoreleasedReturnValue();

            }
          }
          else
          {
            objc_msgSend(v57, "itemForLayoutRole:", 1);
            v443 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v443)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v419 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v419, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 715, CFSTR("App layout should always have primary display item!"));

            }
            objc_msgSend(v454, "uniqueIdentifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v443, "uniqueIdentifier");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v58, "isEqualToString:", v59);

            if (v60)
            {
              v470 = v454;
            }
            else
            {
              objc_msgSend(v443, "bundleIdentifier");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v443, "uniqueIdentifier");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBMainDisplayLayoutStateManager _applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:](self, "_applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:", v100, v101, v430);
              v470 = (id)objc_claimAutoreleasedReturnValue();

              if (!v470)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v420 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v420, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 721, CFSTR("Failed to create primary workspace entity from app layout's primary display item!"));

                v470 = 0;
              }
            }
            objc_msgSend(v57, "itemForLayoutRole:", 2);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            if (v102)
            {
              objc_msgSend(v454, "uniqueIdentifier");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "uniqueIdentifier");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = objc_msgSend(v103, "isEqualToString:", v104);

              if (v105)
              {
                v435 = v454;
              }
              else
              {
                objc_msgSend(v102, "bundleIdentifier");
                v349 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v102, "uniqueIdentifier");
                v350 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBMainDisplayLayoutStateManager _applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:](self, "_applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:", v349, v350, v430);
                v435 = (id)objc_claimAutoreleasedReturnValue();

                if (!v435)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v421 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v421, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 730, CFSTR("Failed to create side workspace entity from app layout's side display item!"));

                  v435 = 0;
                }
              }
              v351 = objc_msgSend(v57, "configuration");
              switch(v351)
              {
                case 0:
                case 1:
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v366 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v366, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 735, CFSTR("Unexpected app layout configuration!"));

                  break;
                case 2:
                case 3:
                case 4:
                  v486 = v351;
                  break;
                default:
                  break;
              }
            }
            else
            {
              +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
              v435 = (id)objc_claimAutoreleasedReturnValue();
            }
            if (v475 == 2)
            {
              v593[0] = MEMORY[0x1E0C809B0];
              v593[1] = 3221225472;
              v593[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_3;
              v593[3] = &unk_1E8EB1C10;
              v594 = v57;
              v595 = v454;
              v596 = self;
              v597 = v430;
              v599 = a2;
              v598 = v477;
              SBLayoutRoleEnumerateAppLayoutRoles(v593);

            }
            objc_msgSend(v57, "itemForLayoutRole:", 4);
            v367 = (void *)objc_claimAutoreleasedReturnValue();
            if (v367)
            {
              objc_msgSend(v454, "uniqueIdentifier");
              v368 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v367, "uniqueIdentifier");
              v369 = (void *)objc_claimAutoreleasedReturnValue();
              v370 = objc_msgSend(v368, "isEqualToString:", v369);

              if (v370)
              {
                v472 = v454;
              }
              else
              {
                objc_msgSend(v367, "bundleIdentifier");
                v371 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v367, "uniqueIdentifier");
                v372 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBMainDisplayLayoutStateManager _applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:](self, "_applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:", v371, v372, v430);
                v472 = (id)objc_claimAutoreleasedReturnValue();

                if (!v472)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v422 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v422, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 780, CFSTR("Failed to create center workspace entity from app layout's center display item!"));

                  v472 = 0;
                }
              }
              if (!v457)
                v457 = SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration(objc_msgSend(v57, "centerConfiguration"));
            }
            else
            {
              +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
              v472 = (id)objc_claimAutoreleasedReturnValue();
            }
            +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
            v466 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          v470 = v454;
          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v435 = (id)objc_claimAutoreleasedReturnValue();
          +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
          v466 = (id)objc_claimAutoreleasedReturnValue();
          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v472 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
    }
    else
    {
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v470 = (id)objc_claimAutoreleasedReturnValue();
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v435 = (id)objc_claimAutoreleasedReturnValue();
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v466 = (id)objc_claimAutoreleasedReturnValue();
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v472 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v475 == 2)
    {
      if (objc_msgSend(v472, "isPreviousWorkspaceEntity"))
      {
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v61 = objc_claimAutoreleasedReturnValue();

        v472 = (id)v61;
      }
      else if ((objc_msgSend(v472, "isEmptyWorkspaceEntity") & 1) == 0)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        v611 = 0x2020000000uLL;
        v590[0] = MEMORY[0x1E0C809B0];
        v590[1] = 3221225472;
        v590[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_4;
        v590[3] = &unk_1E8EB1C38;
        v592 = buf;
        v66 = v477;
        v591 = v66;
        SBLayoutRoleEnumerateValidRoles(v590);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
        {
          objc_msgSend(v66, "setEntity:forLayoutRole:", v472);
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24) == 2)
          {
            v67 = v472;

            v435 = v67;
          }
          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v68 = objc_claimAutoreleasedReturnValue();

          v472 = (id)v68;
        }

        _Block_object_dispose(buf, 8);
      }
      if (!SBPeekConfigurationIsValid(v15) || SBPeekConfigurationIsValid(v17))
      {
        if (!v15 && SBPeekConfigurationIsValid(v17))
        {
          objc_msgSend(v477, "entities");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v477, "previousEntities");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = BSEqualSets();

          if (v71)
          {
            v589 = 0u;
            v588 = 0u;
            v587 = 0u;
            v586 = 0u;
            objc_msgSend(v477, "previousEntities");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v586, v618, 16);
            if (v73)
            {
              v74 = *(_QWORD *)v587;
              do
              {
                for (j = 0; j != v73; ++j)
                {
                  if (*(_QWORD *)v587 != v74)
                    objc_enumerationMutation(v72);
                  objc_msgSend(v477, "setEntity:forLayoutRole:", *(_QWORD *)(*((_QWORD *)&v586 + 1) + 8 * j), objc_msgSend(*(id *)(*((_QWORD *)&v586 + 1) + 8 * j), "layoutRole"));
                }
                v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v586, v618, 16);
              }
              while (v73);
            }
          }
          else
          {
            if (v470
              && (objc_msgSend(v470, "isEmptyWorkspaceEntity") & 1) == 0
              && !objc_msgSend(v470, "isPreviousWorkspaceEntity")
              || v454
              && (objc_msgSend(v454, "isEmptyWorkspaceEntity") & 1) == 0
              && !objc_msgSend(v454, "isPreviousWorkspaceEntity"))
            {
              if (objc_msgSend(v454, "isHomeScreenEntity"))
              {
                if (v18 == 2)
                {
                  v581 = 0u;
                  v580 = 0u;
                  v579 = 0u;
                  v578 = 0u;
                  objc_msgSend(v477, "previousEntities");
                  v340 = (void *)objc_claimAutoreleasedReturnValue();
                  v341 = objc_msgSend(v340, "countByEnumeratingWithState:objects:count:", &v578, v616, 16);
                  if (v341)
                  {
                    v342 = *(_QWORD *)v579;
                    do
                    {
                      for (k = 0; k != v341; ++k)
                      {
                        if (*(_QWORD *)v579 != v342)
                          objc_enumerationMutation(v340);
                        objc_msgSend(v477, "setEntity:forLayoutRole:", *(_QWORD *)(*((_QWORD *)&v578 + 1) + 8 * k), objc_msgSend(*(id *)(*((_QWORD *)&v578 + 1) + 8 * k), "layoutRole"));
                      }
                      v341 = objc_msgSend(v340, "countByEnumeratingWithState:objects:count:", &v578, v616, 16);
                    }
                    while (v341);
                  }

                  objc_msgSend(v477, "setActivatingEntity:", 0);
                  v453 = 0;
                  v493 = 1;
                  v72 = v454;
                }
                else
                {
                  v453 = 0;
                  v493 = 1;
                  v72 = v454;
                  v17 = 1;
                }
              }
              else
              {
                v363 = v454;
                if (!v454
                  || (v364 = objc_msgSend(v454, "isEmptyWorkspaceEntity"), v363 = v454, (v364 & 1) != 0)
                  || (v365 = objc_msgSend(v454, "isPreviousWorkspaceEntity"), v363 = v454, (v365 & 1) != 0))
                {
                  if (v470)
                  {
                    objc_msgSend(v477, "_setRequestedFrontmostEntity:", v470);
                    v363 = v454;
                  }
                }
                else
                {
                  objc_msgSend(v477, "setEntity:forLayoutRole:", v454, 1);

                  v363 = 0;
                }
                v453 = v363;
                v577 = 0u;
                v576 = 0u;
                v575 = 0u;
                v574 = 0u;
                objc_msgSend(v477, "previousEntities");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v388 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v574, v615, 16);
                if (v388)
                {
                  v389 = *(_QWORD *)v575;
                  v17 = 1;
                  v493 = 3;
                  do
                  {
                    for (m = 0; m != v388; ++m)
                    {
                      if (*(_QWORD *)v575 != v389)
                        objc_enumerationMutation(v72);
                      v391 = *(void **)(*((_QWORD *)&v574 + 1) + 8 * m);
                      if ((objc_msgSend(v391, "isHomeScreenEntity") & 1) == 0
                        && (objc_msgSend(v391, "isPreviousWorkspaceEntity") & 1) == 0
                        && (objc_msgSend(v391, "isEmptyWorkspaceEntity") & 1) == 0)
                      {
                        objc_msgSend(v477, "entities");
                        v392 = (void *)objc_claimAutoreleasedReturnValue();
                        v393 = objc_msgSend(v392, "containsObject:", v391);

                        if ((v393 & 1) == 0)
                        {
                          *(_QWORD *)buf = 0;
                          *(_QWORD *)&buf[8] = buf;
                          v611 = 0x2020000000uLL;
                          v571[0] = MEMORY[0x1E0C809B0];
                          v571[1] = 3221225472;
                          v571[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_5;
                          v571[3] = &unk_1E8EB1C38;
                          v573 = buf;
                          v394 = v477;
                          v572 = v394;
                          SBLayoutRoleEnumerateValidRoles(v571);
                          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
                            objc_msgSend(v394, "setEntity:forLayoutRole:", v391);

                          _Block_object_dispose(buf, 8);
                        }
                      }
                    }
                    v388 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v574, v615, 16);
                  }
                  while (v388);
                }
                else
                {
                  v17 = 1;
                  v493 = 3;
                }
              }
              goto LABEL_156;
            }
            v585 = 0u;
            v584 = 0u;
            v583 = 0u;
            v582 = 0u;
            objc_msgSend(v477, "previousEntities");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v582, v617, 16);
            if (v84)
            {
              v85 = *(_QWORD *)v583;
              do
              {
                for (n = 0; n != v84; ++n)
                {
                  if (*(_QWORD *)v583 != v85)
                    objc_enumerationMutation(v72);
                  objc_msgSend(v477, "setEntity:forLayoutRole:", *(_QWORD *)(*((_QWORD *)&v582 + 1) + 8 * n), objc_msgSend(*(id *)(*((_QWORD *)&v582 + 1) + 8 * n), "layoutRole"));
                }
                v84 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v582, v617, 16);
              }
              while (v84);
            }
          }
          v453 = v454;
LABEL_156:

          objc_msgSend(v477, "entityForLayoutRole:", 1);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v87;
          if (v87)
          {
            v89 = v87;
            v90 = v470;
          }
          else
          {
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v89 = (id)objc_claimAutoreleasedReturnValue();

            v90 = v89;
          }

          objc_msgSend(v477, "entityForLayoutRole:", 2);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = v91;
          if (v91)
          {
            v63 = v91;
            v93 = v435;
          }
          else
          {
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v63 = (id)objc_claimAutoreleasedReturnValue();

            v93 = v63;
          }

          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v94 = objc_claimAutoreleasedReturnValue();

          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v95 = objc_msgSend(v89, "isEmptyWorkspaceEntity");
          v451 = 0;
          v96 = v493;
          if (v95)
            v96 = 1;
          v493 = v96;
          v472 = (id)v94;
          v64 = v89;
          v15 = v17;
          goto LABEL_166;
        }
        goto LABEL_199;
      }
      -[SBMainDisplayLayoutStateManager _recentAppLayouts](self, "_recentAppLayouts");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "recentsIncludingHiddenAppLayouts:", 0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (unint64_t)objc_msgSend(v81, "count") < 2;

      v83 = 1;
      if (!v82)
        v83 = 2;
      v493 = v83;
      v451 = v454;
      goto LABEL_136;
    }
    if (SBPeekConfigurationIsValid(v15))
    {
      v62 = v466;
      v63 = v435;
      if ((unint64_t)(v16 - 1) > 1 || v486 != 3)
      {
        v79 = v486;
        if (!v486)
          v79 = 3;
        v486 = v79;
        v451 = v454;
        v64 = v470;
        goto LABEL_166;
      }
      v64 = v470;
      if (v15 == 2)
      {
        v65 = 4;
      }
      else
      {
        if (v15 != 3)
        {
          v486 = 3;
          v451 = v454;
LABEL_166:
          if (!v15)
          {
            v97 = v64;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1038, CFSTR("Peek configuration should not be undefined at this point"));

            v15 = 0;
            v64 = v97;
          }
          goto LABEL_202;
        }
        v65 = 2;
      }
      v486 = v65;
      v451 = v454;
LABEL_202:
      v442 = v15;
      if (v64)
        goto LABEL_203;
      v362 = v63;
      v466 = v62;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v409 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v409, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1042, CFSTR("Primary workspace entity may not be nil at this point!"));
      v360 = 0;
      v354 = v409;
LABEL_658:

      v62 = v466;
      v64 = v360;
      v63 = v362;
LABEL_203:
      v471 = v63;
      if (!v63)
      {
        v395 = v64;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v396 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v396, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1043, CFSTR("Side workspace entity may not be nil at this point!"));

        v64 = v395;
      }
      v108 = v62;
      if (!v62)
      {
        v397 = v64;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v398 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v398, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1044, CFSTR("Floating workspace entity may not be nil at this point!"));

        v64 = v397;
      }
      if (!v472)
      {
        v399 = v64;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v400 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v400, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1045, CFSTR("Center workspace entity may not be nil at this point!"));

        v64 = v399;
      }
      v109 = v64;
      if (objc_msgSend(v64, "isPreviousWorkspaceEntity"))
      {
        ((void (**)(_QWORD, void *, void *))v444)[2](v444, v109, v437);
        v110 = objc_claimAutoreleasedReturnValue();

        v109 = (void *)v110;
      }
      if (objc_msgSend(v63, "isPreviousWorkspaceEntity"))
      {
        ((void (**)(_QWORD, id, void *))v444)[2](v444, v63, v432);
        v111 = objc_claimAutoreleasedReturnValue();

        v471 = (id)v111;
      }
      if (objc_msgSend(v62, "isPreviousWorkspaceEntity"))
      {
        ((void (**)(_QWORD, void *, void *))v444)[2](v444, v62, v433);
        v112 = objc_claimAutoreleasedReturnValue();

        v108 = (void *)v112;
      }
      if (objc_msgSend(v472, "isPreviousWorkspaceEntity"))
      {
        ((void (**)(_QWORD, id, void *))v444)[2](v444, v472, v431);
        v113 = objc_claimAutoreleasedReturnValue();

        v472 = (id)v113;
      }
      v114 = v108;
      v115 = v109;
      if (v109)
      {
        if (v471)
          goto LABEL_219;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v401 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v401, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1063, CFSTR("Primary workspace entity may not be nil at this point!"));

        v114 = v108;
        v115 = 0;
        if (v471)
        {
LABEL_219:
          if (v114)
            goto LABEL_220;
LABEL_701:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v403 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v403, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1065, CFSTR("Floating workspace entity may not be nil at this point!"));

          v115 = v109;
LABEL_220:
          if (!v472)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v404 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v404, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1066, CFSTR("Center workspace entity may not be nil at this point!"));

            v115 = v109;
          }
          if (objc_msgSend(v115, "isPreviousWorkspaceEntity"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v405 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v405, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1068, CFSTR("Primary workspace entity may not be previous entity at this point!"));

          }
          if (objc_msgSend(v471, "isPreviousWorkspaceEntity"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v406 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v406, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1069, CFSTR("Side workspace entity may not be previous entity at this point!"));

          }
          if (objc_msgSend(v108, "isPreviousWorkspaceEntity"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v407 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v407, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1070, CFSTR("Floating workspace entity may not be previous entity at this point!"));

          }
          if (objc_msgSend(v472, "isPreviousWorkspaceEntity"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v408 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v408, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1071, CFSTR("Center workspace entity may not be previous entity at this point!"));

          }
          if (objc_msgSend(v472, "isApplicationSceneEntity")
            && objc_msgSend(v109, "isEmptyWorkspaceEntity")
            && objc_msgSend(v471, "isEmptyWorkspaceEntity"))
          {
            objc_msgSend(v472, "applicationSceneEntity");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "application");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "bundleIdentifier");
            v118 = (void *)objc_claimAutoreleasedReturnValue();

            v119 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v472, "uniqueIdentifier");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "setWithObject:", v120);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBMainDisplayLayoutStateManager _mostRecentAppLayoutForBundleIdentifier:ignoringUniqueIdentifiers:chamoisWindowingUIEnabled:multitaskingSupported:](self, "_mostRecentAppLayoutForBundleIdentifier:ignoringUniqueIdentifiers:chamoisWindowingUIEnabled:multitaskingSupported:", v118, v121, v475 == 2, v475 != 0);
            v122 = (void *)objc_claimAutoreleasedReturnValue();

            if (v122)
            {
              objc_msgSend(v122, "itemForLayoutRole:", 1);
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "bundleIdentifier");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "uniqueIdentifier");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBMainDisplayLayoutStateManager _applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:](self, "_applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:", v124, v125, v430);
              v126 = objc_claimAutoreleasedReturnValue();

              v109 = (void *)v126;
            }
            else
            {
              -[SBMainDisplayLayoutStateManager _sceneManagerForDisplayIdentity:](self, "_sceneManagerForDisplayIdentity:", v430);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = (void *)objc_msgSend(v127, "newSceneIdentifierForBundleIdentifier:", v118);

              -[SBMainDisplayLayoutStateManager _applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:](self, "_applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:", v118, v123, v430);
              v124 = v109;
              v109 = (void *)objc_claimAutoreleasedReturnValue();
            }

            objc_msgSend(v122, "itemForLayoutRole:", 2);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "bundleIdentifier");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "uniqueIdentifier");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBMainDisplayLayoutStateManager _applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:](self, "_applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:", v129, v130, v430);
            v131 = objc_claimAutoreleasedReturnValue();

            SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration(objc_msgSend(v122, "configuration"));
            v471 = (id)v131;
          }
          v132 = v109;
          if ((objc_msgSend(v109, "isEmptyWorkspaceEntity") & 1) != 0
            || objc_msgSend(v109, "isHomeScreenEntity"))
          {
            if (!SBPeekConfigurationIsValid(v442))
            {
              +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
              v133 = objc_claimAutoreleasedReturnValue();

              +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
              v134 = objc_claimAutoreleasedReturnValue();

              v471 = (id)v133;
              v472 = (id)v134;
            }
            if (v493 != 2 && !SBPeekConfigurationIsValid(v442))
            {
              if (objc_msgSend(v473, "unlockedEnvironmentMode") == 2
                && (objc_msgSend(v108, "isEmptyWorkspaceEntity") & 1) == 0
                && (objc_msgSend(v108, "isHomeScreenEntity") & 1) == 0)
              {
                v135 = v108;

                v132 = v135;
              }
              +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
              v136 = objc_claimAutoreleasedReturnValue();

              v108 = (void *)v136;
            }
          }
          if ((objc_msgSend(v472, "isEmptyWorkspaceEntity") & 1) == 0
            && ((SBWorkspaceEntitiesAreAnalagous(v472, v132) & 1) != 0
             || (SBWorkspaceEntitiesAreAnalagous(v472, v471) & 1) != 0
             || SBWorkspaceEntitiesAreAnalagous(v472, v108)))
          {
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v137 = objc_claimAutoreleasedReturnValue();

            v472 = (id)v137;
          }
          if ((objc_msgSend(v471, "isEmptyWorkspaceEntity") & 1) == 0
            && SBWorkspaceEntitiesAreAnalagous(v471, v132))
          {
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v138 = objc_claimAutoreleasedReturnValue();

            v471 = (id)v138;
          }
          if ((objc_msgSend(v108, "isEmptyWorkspaceEntity") & 1) == 0
            && ((SBWorkspaceEntitiesAreAnalagous(v108, v132) & 1) != 0
             || SBWorkspaceEntitiesAreAnalagous(v108, v471)))
          {
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v139 = objc_claimAutoreleasedReturnValue();

            v108 = (void *)v139;
          }
          if ((objc_msgSend(v471, "isEmptyWorkspaceEntity") & 1) == 0
            && (!objc_msgSend(v132, "supportsSplitView")
             || (objc_msgSend(v471, "supportsSplitView") & 1) == 0))
          {
            if (objc_msgSend(v471, "isEqual:", v454))
            {
              v140 = v471;

              v132 = v140;
            }
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v141 = objc_claimAutoreleasedReturnValue();

            v471 = (id)v141;
          }
          if ((objc_msgSend(v108, "isEmptyWorkspaceEntity") & 1) == 0
            && (objc_msgSend(v108, "supportsPresentationAtAnySize") & 1) == 0)
          {
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v142 = objc_claimAutoreleasedReturnValue();

            v108 = (void *)v142;
          }
          if ((objc_msgSend(v472, "isEmptyWorkspaceEntity") & 1) == 0
            && (objc_msgSend(v472, "supportsPresentationAtAnySize") & 1) == 0)
          {
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v143 = objc_claimAutoreleasedReturnValue();

            v472 = (id)v143;
          }
          if (!(objc_msgSend(v471, "isEmptyWorkspaceEntity") & 1 | (v464 != 0)))
          {
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v144 = objc_claimAutoreleasedReturnValue();

            v471 = (id)v144;
          }
          if (!(objc_msgSend(v108, "isEmptyWorkspaceEntity") & 1 | (v464 != 0)))
          {
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v145 = objc_claimAutoreleasedReturnValue();

            v108 = (void *)v145;
          }
          v146 = v132;
          if (v132)
          {
            if (v471)
              goto LABEL_278;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v410 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v410, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1157, CFSTR("Primary workspace entity may not be nil at this point!"));

            v146 = 0;
            if (v471)
              goto LABEL_278;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v411 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v411, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1158, CFSTR("Side workspace entity may not be nil at this point!"));

          v146 = v132;
LABEL_278:
          v467 = v108;
          if (!v108)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v412 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v412, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1159, CFSTR("Floating workspace entity may not be nil at this point!"));

            v146 = v132;
          }
          if (!v472)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v413 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v413, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1160, CFSTR("Center workspace entity may not be nil at this point!"));

            v146 = v132;
          }
          if (objc_msgSend(v146, "isPreviousWorkspaceEntity"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v414 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v414, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1162, CFSTR("Primary workspace entity may not be previous entity at this point!"));

          }
          if (objc_msgSend(v471, "isPreviousWorkspaceEntity"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v415 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v415, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1163, CFSTR("Side workspace entity may not be previous entity at this point!"));

          }
          if (objc_msgSend(v108, "isPreviousWorkspaceEntity"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v416 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v416, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1164, CFSTR("Floating workspace entity may not be previous entity at this point!"));

          }
          if (objc_msgSend(v472, "isPreviousWorkspaceEntity"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v417 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v417, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1165, CFSTR("Center workspace entity may not be previous entity at this point!"));

          }
          if (objc_msgSend(v132, "isEmptyWorkspaceEntity"))
          {

            v132 = 0;
          }
          if (objc_msgSend(v471, "isEmptyWorkspaceEntity"))
          {

            v471 = 0;
          }
          if (objc_msgSend(v108, "isEmptyWorkspaceEntity"))
          {

            v467 = 0;
          }
          if (objc_msgSend(v472, "isEmptyWorkspaceEntity"))
          {

            v472 = 0;
          }
          v147 = v471;
          if (!v132)
          {
            +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = v471;
          }
          v465 = v132;
          if (v147)
          {
            if (SBSpaceConfigurationIsSplitView(v486))
              v148 = v486;
            else
              v148 = v440;
            IsSplitView = SBSpaceConfigurationIsSplitView(v148);
            v150 = 4;
            if (IsSplitView)
              v150 = v148;
          }
          else
          {
            if (!v132 || (objc_msgSend(v132, "isHomeScreenEntity") & 1) != 0)
            {
              v429 = 0;
LABEL_310:
              if (v467)
              {
                if (SBFloatingConfigurationIsValid(v450))
                  v151 = v450;
                else
                  v151 = v460;
                if (v467 == v451 || v467 == v449)
                {
                  IsValid = SBFloatingConfigurationIsValid(v151);
                  if (v151 != 4 && IsValid)
                  {
                    if (v151 == 3)
                      v151 = 1;
                  }
                  else
                  {
                    v151 = 2;
                  }
                }
                if (!SBFloatingConfigurationIsValid(v151))
                  v151 = 4;
                if (!SBPeekConfigurationIsValid(v442))
                {
                  v450 = v151;
                  goto LABEL_338;
                }
                v157 = objc_msgSend(v132, "isHomeScreenEntity");
                v156 = v151;
                v450 = v151;
                if ((v157 & 1) == 0)
                  goto LABEL_334;
              }
              else
              {
                if (SBFloatingConfigurationIsStashed(v460) && SBFloatingConfigurationIsValid(v460))
                {
                  v154 = v460;
LABEL_336:
                  v450 = v154;
                  goto LABEL_338;
                }
                if (objc_msgSend(v451, "isHomeScreenEntity"))
                {
                  v155 = SBFloatingConfigurationIsValid(v460);
                  v156 = v460;
                  if (v155)
                  {
LABEL_334:
                    IsLeft = SBFloatingConfigurationIsLeft(v156);
                    v154 = 3;
                    if (!IsLeft)
                      v154 = 4;
                    goto LABEL_336;
                  }
                }
              }
LABEL_338:
              if ((objc_msgSend(v467, "isEmptyWorkspaceEntity") & 1) == 0 && SBFloatingConfigurationIsStashed(v450))
              {

                v467 = 0;
              }
              if (v472)
              {
                if (SBCenterConfigurationIsValid(v457))
                  v159 = v457;
                else
                  v159 = v438;
                v434 = v159;
                if (!SBCenterConfigurationIsValid(v159))
                {
                  objc_msgSend(v477, "request");
                  v160 = (void *)objc_claimAutoreleasedReturnValue();
                  v161 = objc_msgSend(v160, "centerConfiguration");
                  v162 = 1;
                  if (v161 == 2)
                    v162 = 2;
                  v434 = v162;

                  objc_msgSend(v472, "isEmptyWorkspaceEntity");
                  goto LABEL_355;
                }
              }
              else
              {
                v434 = 0;
              }
              v163 = objc_msgSend(v472, "isEmptyWorkspaceEntity");
              if (v434)
                v164 = 1;
              else
                v164 = v163;
              if ((v164 & 1) == 0)
              {

                v472 = 0;
                v434 = 0;
              }
              goto LABEL_355;
            }
            if (SBPeekConfigurationIsValid(v442))
            {
              if (SBSpaceConfigurationIsValid(v486))
                v335 = v486;
              else
                v335 = v440;
              if (SBSpaceConfigurationIsValid(v335))
                v150 = v335;
              else
                v150 = 1;
            }
            else
            {
              v150 = 1;
            }
          }
          v429 = v150;
          goto LABEL_310;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v402 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v402, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1064, CFSTR("Side workspace entity may not be nil at this point!"));

      v115 = v109;
      if (v108)
        goto LABEL_220;
      goto LABEL_701;
    }
    if (v15 == 1)
    {
LABEL_200:
      v451 = v454;
LABEL_201:
      v62 = v466;
      v64 = v470;
      v63 = v435;
      goto LABEL_202;
    }
    if (!SBPeekConfigurationIsValid(v17))
      goto LABEL_199;
    v76 = v454;
    if (!v454
      || ((v77 = objc_msgSend(v454, "isHomeScreenEntity"), v493 == 2) ? (v78 = 1) : (v78 = v77),
          v76 = v454,
          (v78 & 1) != 0))
    {
      if (objc_msgSend(v76, "isHomeScreenEntity"))
      {
        v15 = v460;
        v62 = v466;
        v64 = v470;
        v63 = v435;
        if (v460 == 1)
        {
          v450 = 3;
          v451 = v454;
        }
        else
        {
          if (v460 == 2)
            v450 = 4;
          v15 = 1;
          v451 = v454;
        }
        goto LABEL_202;
      }
      if (v454 && v493 != 2)
      {
        if (SBFloatingConfigurationIsValid(v460))
          goto LABEL_198;
        goto LABEL_615;
      }
      if ((!v448
         || !v437
         || (objc_msgSend(v448, "isPreviousWorkspaceEntity") & 1) != 0
         || (objc_msgSend(v437, "isEqual:", v448) & 1) != 0
         || (objc_msgSend(v437, "isHomeScreenEntity") & 1) != 0
         || objc_msgSend(v448, "isHomeScreenEntity"))
        && (((v448 != 0) & objc_msgSend(v437, "isHomeScreenEntity")) != 1
         || (objc_msgSend(v448, "isHomeScreenEntity") & 1) != 0
         || objc_msgSend(v448, "isPreviousWorkspaceEntity")))
      {
        if (!SBFloatingConfigurationIsStashed(v460)
          || ((IsStashed = SBFloatingConfigurationIsStashed(v450), !v450) ? (v107 = 1) : (v107 = IsStashed), v107 == 1))
        {
          if (SBFloatingConfigurationIsValid(v460))
          {
LABEL_198:
            +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            v450 = v460;
            v451 = v454;
            v15 = v17;
            goto LABEL_137;
          }
LABEL_615:
          v451 = v454;
          v15 = v17;
LABEL_136:
          v62 = v466;
LABEL_137:
          v64 = v470;
          v63 = v435;
          goto LABEL_166;
        }
      }
LABEL_199:
      v15 = 1;
      goto LABEL_200;
    }
    if (v437 && (objc_msgSend(v437, "isHomeScreenEntity") & 1) == 0)
      v99 = objc_msgSend(v432, "isEmptyWorkspaceEntity") ^ 1;
    else
      v99 = 0;
    if (v432 && (objc_msgSend(v432, "isHomeScreenEntity") & 1) == 0)
      v352 = objc_msgSend(v432, "isEmptyWorkspaceEntity") ^ 1;
    else
      v352 = 0;
    if (v433 && (objc_msgSend(v433, "isHomeScreenEntity") & 1) == 0)
      v353 = objc_msgSend(v433, "isEmptyWorkspaceEntity") ^ 1;
    else
      v353 = 0;
    v354 = v470;
    if ((v99 | v352) != 1)
    {
      if (v353)
      {
        if (!v448
          || (objc_msgSend(v448, "isEmptyWorkspaceEntity") & 1) != 0
          || (objc_msgSend(v448, "isHomeScreenEntity") & 1) != 0
          || ((v446 != 0) & ~objc_msgSend(v448, "isPreviousWorkspaceEntity")) != 1
          || (objc_msgSend(v446, "isEmptyWorkspaceEntity") & 1) != 0
          || (objc_msgSend(v446, "isHomeScreenEntity") & 1) != 0
          || (objc_msgSend(v446, "isPreviousWorkspaceEntity") & 1) != 0)
        {
          v360 = v454;

          +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
          v361 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v360 = v448;

          v361 = v446;
        }
        v362 = v361;

        v354 = v466;
        v442 = 1;
        v466 = v433;
        v450 = v460;
        v451 = v454;
      }
      else
      {
        v442 = 1;
        v362 = v435;
        v360 = v454;
        v451 = v360;
      }
      goto LABEL_658;
    }
    v355 = v437;
    v356 = v454;
    if (v17 != 2)
    {
      if (v17 != 3)
      {
LABEL_641:
        +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
        v359 = objc_claimAutoreleasedReturnValue();

        v15 = 1;
        v451 = v454;
        v472 = (id)v359;
        goto LABEL_201;
      }
      v355 = v454;
      v356 = v437;
    }
    v357 = v355;

    v358 = v356;
    v435 = v358;
    v470 = v357;
    goto LABEL_641;
  }

  v33 = v448;
  if (!v448)
  {
    v33 = v454;
    if (!v33)
    {
      +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v418 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v418, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1314, CFSTR("Primary workspace entity may not be nil at this point!"));

        v33 = 0;
      }
    }
  }
  v569[0] = MEMORY[0x1E0C809B0];
  v569[1] = 3221225472;
  v569[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_6;
  v569[3] = &unk_1E8EB1C60;
  v34 = v437;
  v570 = v34;
  v35 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v569);
  if (objc_msgSend(v33, "isPreviousWorkspaceEntity"))
  {
    ((void (**)(_QWORD, id, id))v35)[2](v35, v33, v34);
    v36 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v36;
  }
  else
  {
    v37 = v33;
  }
  v41 = v37;
  if (objc_msgSend(v37, "isEmptyWorkspaceEntity"))
  {

  }
  else
  {
    v42 = v41;
    if (v41)
      goto LABEL_46;
  }
  +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    v465 = 0;
    v429 = 0;
    goto LABEL_48;
  }
LABEL_46:
  v465 = v42;
  v429 = objc_msgSend(v42, "isHomeScreenEntity") ^ 1;
LABEL_48:

  v471 = 0;
  v472 = 0;
  v467 = 0;
  v442 = 0;
  v434 = 0;
  v450 = 0;
  v451 = v454;
LABEL_355:
  v165 = v493;
  if (!v493)
  {
    if ((objc_msgSend(v465, "isHomeScreenEntity") & 1) != 0 || SBPeekConfigurationIsValid(v442))
      v165 = 1;
    else
      v165 = 3;
  }
  v439 = v165;
  IsYes = BSSettingFlagIsYes();
  if (v472)
    HIDWORD(v428) = BSSettingFlagIsYes();
  else
    HIDWORD(v428) = 0;
  v441 = v462;
  v166 = SBPeekConfigurationIsValid(objc_msgSend(v473, "peekConfiguration"));
  v167 = objc_msgSend(v473, "unlockedEnvironmentMode");
  v168 = v167 == 2 && v475 == 2;
  if (v441)
    v168 = 1;
  v169 = v168 || v166;
  if (v168)
    v170 = v441;
  else
    v170 = 0;
  v463 = v170;
  if (!v169)
  {
    if (objc_msgSend(v451, "isApplicationSceneEntity"))
    {
      v171 = v451;
      objc_msgSend(v171, "application");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "bundleIdentifier");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "activationSettings");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "objectForActivationSetting:", 45);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = v175 == 0;

      LODWORD(v174) = objc_msgSend(v171, "BOOLForActivationSetting:", 40);
      if (((v176 | v174 | objc_msgSend(v172, "isWebApplication")) & 1) != 0)
        goto LABEL_379;
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = objc_msgSend(v177, "userInterfaceIdiom");

      if ((v178 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        goto LABEL_379;
      objc_msgSend(v172, "info");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = objc_msgSend(v179, "supportsMultiwindow");

      if (v180)
      {
        *(_QWORD *)&v532 = 0;
        *((_QWORD *)&v532 + 1) = &v532;
        *(_QWORD *)&v533 = 0x2020000000;
        BYTE8(v533) = 0;
        if (v475 == 2)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&v611 = 0x3032000000;
          *((_QWORD *)&v611 + 1) = __Block_byref_object_copy__66;
          *(_QWORD *)&v612 = __Block_byref_object_dispose__66;
          *((_QWORD *)&v612 + 1) = 0;
          v568[0] = 0;
          v568[1] = v568;
          v568[2] = 0x2020000000;
          v568[3] = 0;
          v564[0] = MEMORY[0x1E0C809B0];
          v564[1] = 3221225472;
          v564[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_50;
          v564[3] = &unk_1E8EB1C88;
          v565 = v473;
          v566 = v568;
          v567 = buf;
          SBLayoutRoleEnumerateValidRoles(v564);
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "application");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v181, "bundleIdentifier");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          v183 = objc_msgSend(v182, "isEqualToString:", v173);
          *(_BYTE *)(*((_QWORD *)&v532 + 1) + 24) = v183;

          _Block_object_dispose(v568, 8);
          _Block_object_dispose(buf, 8);

        }
        else
        {
          v560[0] = MEMORY[0x1E0C809B0];
          v560[1] = 3221225472;
          v560[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2_51;
          v560[3] = &unk_1E8EB0ED0;
          v561 = v477;
          v563 = &v532;
          v562 = v173;
          SBLayoutRoleEnumerateValidRoles(v560);

        }
        objc_msgSend(v473, "bundleIDShowingAppExpose");
        v336 = objc_claimAutoreleasedReturnValue();
        v337 = (void *)v336;
        v463 = 0;
        v339 = v167 == 2 && v336 != 0;
        if (*(_BYTE *)(*((_QWORD *)&v532 + 1) + 24) && !v339)
        {
          if ((BSEqualStrings() & 1) != 0)
            v463 = 0;
          else
            v463 = v173;
        }

        _Block_object_dispose(&v532, 8);
      }
      else
      {
LABEL_379:
        v463 = 0;
      }

    }
    else
    {
      v463 = 0;
    }
  }
  if (v475 == 2)
  {
    v184 = 0;
  }
  else
  {
    objc_msgSend(v451, "applicationSceneEntity");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainDisplayLayoutStateManager _recentAppLayouts](self, "_recentAppLayouts");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = objc_msgSend(v186, "_transitionContextRepresentsAmbiguousLaunch:forApplicationSceneEntity:", v477, v185);

    if (v187)
    {
      v188 = SBPeekConfigurationIsValid(objc_msgSend(v473, "peekConfiguration"));
      if (v467)
        v189 = 0;
      else
        v189 = v188;
      if (v189)
      {
        v190 = 2;
        if (v451 != v471)
          v190 = 0;
        if (v451 == v465)
          v190 = 1;
        v191 = v455;
        if (v190)
          v191 = v190;
        v455 = v191;
      }
      else
      {
        objc_msgSend(v185, "application");
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v192, "bundleIdentifier");
        v193 = objc_claimAutoreleasedReturnValue();

        v463 = (id)v193;
      }
    }

    v184 = v455;
  }
  v456 = v184;
  if (v463)
  {
    -[SBMainDisplayLayoutStateManager _applicationController](self, "_applicationController");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "applicationWithBundleIdentifier:", v463);
    v195 = (void *)objc_claimAutoreleasedReturnValue();

    if (v475 != 2 && (objc_msgSend(v195, "supportsMultitaskingShelf") & 1) == 0)
    {

      v463 = 0;
    }

    v184 = v456;
  }
  else
  {
    v463 = 0;
  }
  if (v184)
  {
    v196 = v465;
    if (v184 == 1 || (v196 = v471, v184 == 2) || (v196 = v467, v184 == 3) || (v196 = v472, v184 == 4))
      v197 = v196;
    else
      v197 = 0;
    objc_msgSend(v197, "applicationSceneEntity");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "application");
    v199 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v199 || (objc_msgSend(v199, "supportsMultitaskingShelf") & 1) == 0)
      v456 = 0;

  }
  else
  {
    v456 = 0;
  }
  if (!v463)
  {
    objc_msgSend(v473, "bundleIDShowingAppExpose");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v203
      || ((v204 = objc_msgSend(v473, "unlockedEnvironmentMode"), v439 == 2) ? (v205 = v204 == 2) : (v205 = 0),
          !v205 ? (v206 = 0) : (v206 = 1),
          v203,
          !v206))
    {
      v463 = 0;
      goto LABEL_433;
    }
    objc_msgSend(v473, "bundleIDShowingAppExpose");
    v463 = (id)objc_claimAutoreleasedReturnValue();
    if (!v463)
    {
      v463 = 0;
LABEL_430:
      v202 = 2;
      goto LABEL_431;
    }
  }
  v200 = objc_msgSend(v473, "unlockedEnvironmentMode");
  v201 = v493 - 3;
  if (v200 != 3)
  {
    if (((v201 < 0xFFFFFFFFFFFFFFFELL) & objc_msgSend(v451, "isApplicationSceneEntity")) != 0)
      goto LABEL_417;
LABEL_429:
    IsYes = 0;
    goto LABEL_430;
  }
  if (v201 >= 0xFFFFFFFFFFFFFFFELL)
    goto LABEL_429;
LABEL_417:
  IsYes = 0;
  v202 = 3;
LABEL_431:
  v439 = v202;
LABEL_433:
  if (objc_msgSend(v465, "isPreviousWorkspaceEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v380 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v380, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1513, CFSTR("Primary workspace entity may not be previous entity at this point!"));

  }
  if (objc_msgSend(v471, "isPreviousWorkspaceEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v381 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v381, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1514, CFSTR("Side workspace entity may not be previous entity at this point!"));

  }
  if (objc_msgSend(v467, "isPreviousWorkspaceEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v382 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v382, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1515, CFSTR("Floating workspace entity may not be previous entity at this point!"));

  }
  if (objc_msgSend(v472, "isPreviousWorkspaceEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v383 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v383, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1516, CFSTR("Center workspace entity may not be previous entity at this point!"));

  }
  if (objc_msgSend(v465, "isEmptyWorkspaceEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v384 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v384, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1518, CFSTR("Primary workspace entity may not be empty entity at this point!"));

  }
  if (objc_msgSend(v471, "isEmptyWorkspaceEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v385 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v385, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1519, CFSTR("Side workspace entity may not be empty entity at this point!"));

  }
  if (objc_msgSend(v467, "isEmptyWorkspaceEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v386 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v386, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1520, CFSTR("Floating workspace entity may not be empty entity at this point!"));

  }
  if (objc_msgSend(v472, "isEmptyWorkspaceEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v387 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v387, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMainDisplayLayoutStateManager.m"), 1521, CFSTR("Center workspace entity may not be empty entity at this point!"));

  }
  objc_msgSend(v477, "setActivatingEntity:", 0);
  objc_msgSend(v477, "setEntity:forLayoutRole:", v465, 1);
  objc_msgSend(v477, "setEntity:forLayoutRole:", v471, 2);
  objc_msgSend(v477, "setEntity:forLayoutRole:", v467, 3);
  objc_msgSend(v477, "setEntity:forLayoutRole:", v472, 4);
  v207 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v458 = v207;
  if (v465)
  {
    __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke((uint64_t)v207, v465);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    if (v208)
      objc_msgSend(v458, "addObject:", v208);

  }
  if (v471)
  {
    __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke((uint64_t)v207, v471);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    if (v209)
    {
      objc_msgSend(v458, "addObject:", v209);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&v611 = 0x2020000000;
      *((_QWORD *)&v611 + 1) = 5;
      v550[0] = MEMORY[0x1E0C809B0];
      v550[1] = 3221225472;
      v550[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_3_60;
      v550[3] = &unk_1E8EB1CB0;
      v551 = v477;
      v557 = v444;
      v552 = v465;
      v553 = v471;
      v554 = v472;
      v210 = v467;
      v559 = buf;
      v555 = v210;
      v558 = &__block_literal_global_192;
      v556 = v458;
      SBLayoutRoleEnumerateValidRoles(v550);

      _Block_object_dispose(buf, 8);
    }

  }
  if (v467)
  {
    __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke((uint64_t)v207, v467);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    if (v211)
      objc_msgSend(v458, "addObject:", v211);

  }
  if (v472)
  {
    __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke((uint64_t)v207, v472);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    if (v212)
      objc_msgSend(v458, "addObject:", v212);

  }
  v213 = objc_msgSend(v458, "count");
  v214 = v458;
  if (!v213)
    v214 = 0;
  v215 = v214;
  v216 = objc_opt_class();
  SBSafeCast(v216, v473);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v217, "elementIdentifiersToLayoutAttributes");
  v480 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v477, "requestedEntityIdentifierToLayoutAttributes");
  v491 = (id)objc_claimAutoreleasedReturnValue();
  v495 = (void *)objc_opt_new();
  v549 = 0u;
  v548 = 0u;
  v547 = 0u;
  v546 = 0u;
  obja = v215;
  v498 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v546, v614, 16);
  if (v498)
  {
    v488 = *(_QWORD *)v547;
    do
    {
      v218 = 0;
      do
      {
        if (*(_QWORD *)v547 != v488)
          objc_enumerationMutation(obja);
        v219 = *(void **)(*((_QWORD *)&v546 + 1) + 8 * v218);
        objc_msgSend(v219, "uniqueIdentifier");
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v491, "objectForKey:", v220);
        v221 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();
        if (!v221)
        {
          objc_msgSend(v480, "objectForKey:", v220);
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          if (v222)
          {
            v221 = v222;

          }
          else
          {
            v223 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v219, "uniqueIdentifier");
            v224 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v223, "setWithObject:", v224);
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBMainDisplayLayoutStateManager _mostRecentAppLayoutMatchingAnyUniqueIdentifier:chamoisWindowingUIEnabled:multitaskingSupported:](self, "_mostRecentAppLayoutMatchingAnyUniqueIdentifier:chamoisWindowingUIEnabled:multitaskingSupported:", v225, v475 == 2, v475 != 0);
            v226 = (void *)objc_claimAutoreleasedReturnValue();

            if (v226)
            {
              objc_msgSend(v226, "allItems");
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              v545[0] = MEMORY[0x1E0C809B0];
              v545[1] = 3221225472;
              v545[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_4_62;
              v545[3] = &unk_1E8E9DF50;
              v545[4] = v219;
              objc_msgSend(v227, "bs_firstObjectPassingTest:", v545);
              v228 = (void *)objc_claimAutoreleasedReturnValue();

              if (v474 == 11)
                goto LABEL_479;
              if (v474 == 50)
                goto LABEL_479;
              -[SBMainDisplayLayoutStateManager _recentAppLayouts](self, "_recentAppLayouts");
              v229 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v229, "bestLastDisplayItemLayoutAttributesMapForAppLayout:displayOrdinal:", v226, objc_msgSend(v473, "displayOrdinal"));
              v230 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v230, "objectForKey:", v228);
              v231 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v231)
              {
LABEL_479:
                v232 = 1;
                if (v228)
                  v232 = objc_msgSend(v226, "layoutRoleForItem:", v228);
                objc_msgSend(v226, "layoutAttributesForItemInRole:", v232);
                v231 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v233 = v231;

              v221 = v233;
            }
            else
            {
              objc_msgSend(v219, "workspaceEntity");
              v234 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v234, "applicationSceneEntity");
              v235 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v235, "application");
              v236 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v236, "bundleIdentifier");
              v233 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();

              if (v233)
              {
                -[SBMainDisplayLayoutStateManager _recentAppLayouts](self, "_recentAppLayouts");
                v237 = (void *)objc_claimAutoreleasedReturnValue();
                v543[0] = MEMORY[0x1E0C809B0];
                v543[1] = 3221225472;
                v543[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_5_63;
                v543[3] = &unk_1E8E9DF78;
                v233 = v233;
                v544 = v233;
                objc_msgSend(v237, "mostRecentAppLayoutIncludingHiddenAppLayouts:passingTest:", 1, v543);
                v238 = (void *)objc_claimAutoreleasedReturnValue();

                if (v238)
                {
                  v541[0] = MEMORY[0x1E0C809B0];
                  v541[1] = 3221225472;
                  v541[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_6_64;
                  v541[3] = &unk_1E8E9DF50;
                  v542 = v233;
                  objc_msgSend(v238, "latestItemPassingTest:", v541);
                  v239 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v239)
                  {
                    objc_msgSend(v238, "layoutAttributesForItem:", v239);
                    v240 = (void *)objc_claimAutoreleasedReturnValue();
                    v241 = v240;
                    if (v240)
                    {
                      objc_msgSend(v240, "attributedSize");
                    }
                    else
                    {
                      v540 = 0;
                      memset(v539, 0, sizeof(v539));
                    }
                    objc_msgSend(0, "attributesByModifyingAttributedSize:", v539);
                    v242 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v242, "attributesByModifyingSizingPolicy:", objc_msgSend(v241, "sizingPolicy"));
                    v221 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v221 = 0;
                  }

                }
                else
                {
                  v221 = 0;
                }
                objc_msgSend(v477, "entityForLayoutRole:", 4);
                v243 = (void *)objc_claimAutoreleasedReturnValue();
                v244 = v243 == 0;

                if (!v244)
                {
                  -[SBDisplayItemLayoutAttributes attributesByModifyingAttributedSize:](v221, "attributesByModifyingAttributedSize:", v538, SBDisplayItemAttributedSizeUnspecified((uint64_t)v538).n128_f64[0]);
                  v245 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v245, "attributesByModifyingSizingPolicy:", 0);
                  v221 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();

                }
              }
              else
              {
                v221 = 0;
              }
            }

            if (!v221)
            {
              v221 = objc_alloc_init(SBDisplayItemLayoutAttributes);
              if (!v221)
              {
                v537 = 0;
                memset(v536, 0, sizeof(v536));
                goto LABEL_500;
              }
            }
          }
        }
        -[SBDisplayItemLayoutAttributes attributedSize](v221, "attributedSize");
LABEL_500:
        if (SBDisplayItemAttributedSizeIsUnspecified((uint64_t)v536) && SBFIsChamoisWindowingUIAvailable())
        {
          objc_msgSend(v219, "workspaceEntity");
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v246, "deviceApplicationSceneEntity");
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v247, "sceneHandle");
          v248 = (void *)objc_claimAutoreleasedReturnValue();

          if (v248 && (objc_msgSend(v248, "supportsCenterWindow") & 1) == 0)
          {
            objc_msgSend(v248, "application");
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            v250 = v249;
            if (v249)
            {
              objc_msgSend(v249, "bundleIdentifier");
              v251 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E60], "set");
              v252 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBMainDisplayLayoutStateManager _mostRecentAppLayoutForBundleIdentifier:ignoringUniqueIdentifiers:chamoisWindowingUIEnabled:multitaskingSupported:](self, "_mostRecentAppLayoutForBundleIdentifier:ignoringUniqueIdentifiers:chamoisWindowingUIEnabled:multitaskingSupported:", v251, v252, v475 == 2, v475 != 0);
              v253 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v253)
              {
                objc_msgSend(v250, "lastWindowLayoutAttributes");
                v254 = (void *)objc_claimAutoreleasedReturnValue();
                v255 = v254;
                if (v254)
                {
                  v256 = objc_msgSend(v254, "sizingPolicy");
                  v613 = 0;
                  v612 = 0u;
                  v611 = 0u;
                  *(_OWORD *)buf = 0u;
                  objc_msgSend(v255, "attributedSize");
                  objc_msgSend(v255, "normalizedCenter");
                  v258 = v257;
                  v260 = v259;
                  v261 = objc_msgSend(v255, "isPositionSystemManaged");
                  if (SBDisplayItemSizingPolicyIsValid(v256))
                  {
                    v532 = *(_OWORD *)buf;
                    v533 = v611;
                    v534 = v612;
                    v535 = v613;
                    if (SBDisplayItemAttributedSizeIsValid((uint64_t)&v532))
                    {
                      v461 = objc_msgSend(v255, "contentOrientation");
                      if (v461)
                      {
                        +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
                        v262 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v262, "_setInterfaceOrientationFromUserResizingIfSupported:forSceneHandle:", v461, v248);

                      }
                      v447 = [SBDisplayItemLayoutAttributes alloc];
                      v263 = -[SBDisplayItemLayoutAttributes lastInteractionTime](v221, "lastInteractionTime");
                      SBDisplayItemAttributedSizeUnspecified((uint64_t)v531);
                      v532 = *(_OWORD *)buf;
                      v533 = v611;
                      v534 = v612;
                      v535 = v613;
                      LOBYTE(v426) = v261;
                      v264 = -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:](v447, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", v461, v263, v256, &v532, 0, v531, v258, v260, 0.0, 0.0, v426);

                      v221 = (SBDisplayItemLayoutAttributes *)v264;
                    }
                  }
                }

              }
            }

          }
        }
        objc_msgSend(v495, "setObject:forKey:", v221, v220);

        ++v218;
      }
      while (v498 != v218);
      v265 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v546, v614, 16);
      v498 = v265;
    }
    while (v265);
  }

  +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "chamoisSettings");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v268 = objc_msgSend(v267, "maximumNumberOfAppsOnStage");

  if (v475 == 2 && objc_msgSend(obja, "count") > v268)
  {
    objc_msgSend(obja, "allObjects");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    v529[0] = MEMORY[0x1E0C809B0];
    v529[1] = 3221225472;
    v529[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_7;
    v529[3] = &unk_1E8EB1CD8;
    v530 = v495;
    objc_msgSend(v269, "sortedArrayUsingComparator:", v529);
    v270 = (void *)objc_claimAutoreleasedReturnValue();

    v271 = (void *)objc_opt_new();
    v527 = 0u;
    v528 = 0u;
    v525 = 0u;
    v526 = 0u;
    v272 = v270;
    v273 = objc_msgSend(v272, "countByEnumeratingWithState:objects:count:", &v525, v609, 16);
    if (v273)
    {
      v274 = 0;
      v275 = *(_QWORD *)v526;
      do
      {
        for (ii = 0; ii != v273; ++ii)
        {
          if (*(_QWORD *)v526 != v275)
            objc_enumerationMutation(v272);
          v277 = *(void **)(*((_QWORD *)&v525 + 1) + 8 * ii);
          if (SBLayoutRoleIsValidForSplitView(objc_msgSend(v277, "layoutRole")) && ++v274 > v268)
            continue;
          objc_msgSend(v271, "addObject:", v277);
        }
        v273 = objc_msgSend(v272, "countByEnumeratingWithState:objects:count:", &v525, v609, 16);
      }
      while (v273);
    }

    objc_msgSend(v477, "entities");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    v523[0] = MEMORY[0x1E0C809B0];
    v523[1] = 3221225472;
    v523[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_8;
    v523[3] = &unk_1E8EB1D00;
    v279 = v278;
    v524 = v279;
    v280 = (void *)MEMORY[0x1D17E5550](v523);
    v521[0] = MEMORY[0x1E0C809B0];
    v521[1] = 3221225472;
    v521[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_10;
    v521[3] = &unk_1E8EB1D28;
    v281 = v280;
    v522 = v281;
    objc_msgSend(v271, "bs_map:", v521);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v282, "allObjects");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    v519[0] = MEMORY[0x1E0C809B0];
    v519[1] = 3221225472;
    v519[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_11;
    v519[3] = &unk_1E8EB1D28;
    v284 = v281;
    v520 = v284;
    objc_msgSend(v271, "bs_compactMap:", v519);
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v285, "anyObject");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    v517[0] = MEMORY[0x1E0C809B0];
    v517[1] = 3221225472;
    v517[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_12;
    v517[3] = &unk_1E8EB1D28;
    v287 = v284;
    v518 = v287;
    objc_msgSend(v271, "bs_compactMap:", v517);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v288, "anyObject");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v477, "setEntities:withPolicy:centerEntity:floatingEntity:", v283, 0, v286, v289);

    v515 = 0u;
    v516 = 0u;
    v513 = 0u;
    v514 = 0u;
    objc_msgSend(v477, "entities");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    v291 = (void *)objc_msgSend(v290, "copy");

    v292 = objc_msgSend(v291, "countByEnumeratingWithState:objects:count:", &v513, v608, 16);
    if (v292)
    {
      v293 = *(_QWORD *)v514;
      do
      {
        for (jj = 0; jj != v292; ++jj)
        {
          if (*(_QWORD *)v514 != v293)
            objc_enumerationMutation(v291);
          v295 = *(void **)(*((_QWORD *)&v513 + 1) + 8 * jj);
          if ((objc_msgSend(v295, "isEmptyWorkspaceEntity") & 1) != 0
            || objc_msgSend(v295, "isPreviousWorkspaceEntity"))
          {
            objc_msgSend(v477, "setEntity:forLayoutRole:", 0, objc_msgSend(v295, "layoutRole"));
          }
        }
        v292 = objc_msgSend(v291, "countByEnumeratingWithState:objects:count:", &v513, v608, 16);
      }
      while (v292);
    }

    objc_msgSend(v477, "entities");
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    v511[0] = MEMORY[0x1E0C809B0];
    v511[1] = 3221225472;
    v511[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_13;
    v511[3] = &unk_1E8EB1D50;
    v512 = &__block_literal_global_192;
    objc_msgSend(v296, "bs_map:", v511);
    v297 = objc_claimAutoreleasedReturnValue();

    obja = (id)v297;
  }
  v298 = [SBMainDisplayLayoutState alloc];
  v299 = objc_msgSend(v473, "displayOrdinal");
  LOBYTE(v428) = objc_msgSend(v473, "isDisplayExternal");
  LOBYTE(v427) = BYTE4(v428);
  v497 = -[SBMainDisplayLayoutState _initWithLayoutElements:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:](v298, "_initWithLayoutElements:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:", obja, v429, v495, v450, v439, IsYes, v434, v427, v442, v463, v456, v299, v428);

LABEL_544:
  *(_QWORD *)&v532 = 0;
  *(_QWORD *)&v532 = objc_msgSend(v497, "interfaceOrientation");
  SBLogCommon();
  v300 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v300, OS_LOG_TYPE_DEFAULT))
  {
    SBStringForUnlockedEnvironmentMode(objc_msgSend(v497, "unlockedEnvironmentMode"));
    v301 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v301;
    _os_log_impl(&dword_1D0540000, v300, OS_LOG_TYPE_DEFAULT, "[92869424] unlockedEnvironmentMode: %{public}@", buf, 0xCu);

  }
  v506 = 0;
  objc_msgSend(v469, "switcherOrientation:elementsOrientations:forTransitionRequest:previousLayoutState:layoutState:", &v532, &v506, v468, v473, v497);
  objb = v506;
  objc_msgSend(v497, "setInterfaceOrientation:", (_QWORD)v532);
  objc_msgSend(v497, "setInterfaceOrientationByLayoutElementIdentifier:", objb);
  objc_msgSend(v469, "layoutElementSizingPoliciesForLayoutState:", v497);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v497, "_updateSizingPoliciesForLayoutElements:", v302);

  objc_msgSend(v497, "appLayout");
  v303 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v469, "windowScene");
  v489 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v489 || !v303 || !objc_msgSend(v469, "isChamoisWindowingUIEnabled"))
  {
    v309 = v303;
    goto LABEL_582;
  }
  v478 = objc_alloc_init(SBDisplayItemLayoutAttributesCalculator);
  objc_msgSend(v473, "appLayout");
  v481 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v468, "source") != 3 && objc_msgSend(v468, "source") != 63)
    goto LABEL_555;
  objc_msgSend(v303, "allItems");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  v305 = objc_msgSend(v304, "count");
  objc_msgSend(v481, "allItems");
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  if (v305 <= objc_msgSend(v306, "count"))
  {

LABEL_555:
    v308 = 0;
    goto LABEL_556;
  }
  v307 = objc_msgSend(v303, "containsAnyItemFromAppLayout:", v481);

  v308 = v307;
LABEL_556:
  -[SBDisplayItemLayoutAttributesCalculator appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:windowScene:source:](v478, "appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:windowScene:source:", v303, v481, v308, objc_msgSend(v497, "interfaceOrientation"), v489, objc_msgSend(v468, "source"));
  v309 = (void *)objc_claimAutoreleasedReturnValue();

  v504 = 0u;
  v505 = 0u;
  v502 = 0u;
  v503 = 0u;
  objc_msgSend(v309, "allItems");
  v492 = (id)objc_claimAutoreleasedReturnValue();
  v310 = objc_msgSend(v492, "countByEnumeratingWithState:objects:count:", &v502, v606, 16);
  if (v310)
  {
    v496 = *(_QWORD *)v503;
    do
    {
      for (kk = 0; kk != v310; ++kk)
      {
        if (*(_QWORD *)v503 != v496)
          objc_enumerationMutation(v492);
        v312 = *(_QWORD *)(*((_QWORD *)&v502 + 1) + 8 * kk);
        objc_msgSend(v309, "layoutAttributesForItem:", v312);
        v313 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v497, "elementWithRole:", objc_msgSend(v309, "layoutRoleForItem:", v312));
        v314 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v497, "_setLayoutAttributes:forLayoutElement:", v313, v314);
        objc_msgSend(v314, "workspaceEntity");
        v315 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v315, "deviceApplicationSceneEntity");
        v316 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v316, "sceneHandle");
        v317 = (void *)objc_claimAutoreleasedReturnValue();

        if (v317 && (objc_msgSend(v317, "supportsCenterWindow") & 1) == 0)
        {
          objc_msgSend(v317, "application");
          v318 = (void *)objc_claimAutoreleasedReturnValue();
          v319 = v318;
          if (v318)
          {
            objc_msgSend(v318, "lastWindowLayoutAttributes");
            v320 = (void *)objc_claimAutoreleasedReturnValue();
            v321 = v320;
            if (!v320)
              goto LABEL_573;
            v322 = objc_msgSend(v320, "sizingPolicy");
            if (v322 != objc_msgSend(v313, "sizingPolicy"))
              goto LABEL_573;
            objc_msgSend(v321, "attributedSize");
            if (v313)
            {
              objc_msgSend(v313, "attributedSize");
            }
            else
            {
              v500 = 0;
              memset(v499, 0, sizeof(v499));
            }
            if (!SBEqualDisplayItemAttributedSizes((uint64_t)v501, (uint64_t)v499)
              || (objc_msgSend(v321, "normalizedCenter"),
                  v324 = v323,
                  v326 = v325,
                  objc_msgSend(v313, "normalizedCenter"),
                  v324 != v328)
              || v326 != v327
              || (v329 = objc_msgSend(v321, "isPositionSystemManaged"),
                  v329 != objc_msgSend(v313, "isPositionSystemManaged")))
            {
LABEL_573:
              v330 = v313;
              v331 = objc_msgSend(v317, "_interfaceOrientationFromUserResizing");
              if (!v331 || v331 != objc_msgSend(v330, "contentOrientation"))
              {
                objc_msgSend(v330, "attributesByModifyingContentOrientation:", 0);
                v332 = objc_claimAutoreleasedReturnValue();

                v330 = (id)v332;
              }
              objc_msgSend(v319, "setLastWindowLayoutAttributes:", v330);

            }
          }

        }
      }
      v310 = objc_msgSend(v492, "countByEnumeratingWithState:objects:count:", &v502, v606, 16);
    }
    while (v310);
  }

LABEL_582:
  v333 = v497;

  return v333;
}

- (id)_switcherControllerForDisplayIdentity:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)SBApp;
  v4 = a3;
  objc_msgSend(v3, "windowSceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowSceneForDisplayIdentity:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "switcherController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SBMainWorkspace)_mainWorkspace
{
  return (SBMainWorkspace *)+[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
}

- (id)_mostRecentAppLayoutMatchingAnyUniqueIdentifier:(id)a3 chamoisWindowingUIEnabled:(BOOL)a4 multitaskingSupported:(BOOL)a5
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  _BOOL4 v21;
  SBMainDisplayLayoutStateManager *v22;
  id obj;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  uint64_t *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v21 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v22 = self;
  -[SBMainDisplayLayoutStateManager _recentAppLayouts](self, "_recentAppLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recentsIncludingHiddenAppLayouts:", 1);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v28)
  {
    v7 = 0;
    v26 = *(_QWORD *)v44;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v26)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
      v39 = 0;
      v40 = &v39;
      v41 = 0x2020000000;
      v42 = 0;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __131__SBMainDisplayLayoutStateManager__mostRecentAppLayoutMatchingAnyUniqueIdentifier_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke;
      v36[3] = &unk_1E8EB1B58;
      v36[4] = v9;
      v10 = v27;
      v37 = v10;
      v38 = &v39;
      SBLayoutRoleEnumerateAppLayoutRoles(v36);
      v11 = *((unsigned __int8 *)v40 + 24);
      if (*((_BYTE *)v40 + 24))
      {
        v12 = v9;

        if (!SBFIsChamoisWindowingUIAvailable() || a4)
        {
          v7 = v12;
        }
        else
        {
          -[SBMainDisplayLayoutStateManager _applicationController](v22, "_applicationController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:multitaskingSupported:", v13, v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v25;
          if (v25)
          {
            *((_BYTE *)v40 + 24) = 0;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v15 = v25;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
            if (v16)
            {
              v17 = *(_QWORD *)v33;
              while (2)
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v33 != v17)
                    objc_enumerationMutation(v15);
                  v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                  v29[0] = MEMORY[0x1E0C809B0];
                  v29[1] = 3221225472;
                  v29[2] = __131__SBMainDisplayLayoutStateManager__mostRecentAppLayoutMatchingAnyUniqueIdentifier_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke_2;
                  v29[3] = &unk_1E8EB1B58;
                  v29[4] = v19;
                  v30 = v10;
                  v31 = &v39;
                  SBLayoutRoleEnumerateAppLayoutRoles(v29);
                  if (*((_BYTE *)v40 + 24))
                  {
                    v7 = v19;

                    goto LABEL_21;
                  }

                }
                v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
                if (v16)
                  continue;
                break;
              }
            }
            v7 = v12;
LABEL_21:

            v14 = v25;
          }
          else
          {
            v7 = v12;
          }

        }
      }

      _Block_object_dispose(&v39, 8);
      if (v11)
        break;
      if (++v8 == v28)
      {
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v28)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)defaultSceneIdentifierForBundleIdentifier:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleSceneIdentifiers:(id)a7 excludingSceneIdentifiers:(id)a8 sceneSessionRole:(id)a9 preferredDisplay:(id)a10
{
  _BOOL4 v12;
  id v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  int v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  __CFString *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  id v73;
  id v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  NSObject *v78;
  const char *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  NSObject *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  __int128 v96;
  id v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  id v103;
  int v104;
  id v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const __CFString *v112;
  id v113;
  __int128 *v114;
  const __CFString *v115;
  _BOOL4 v116;
  unint64_t v117;
  void *v118;
  void *v119;
  id v120;
  id v121;
  id v122;
  __CFString *v123;
  id v124;
  id v125;
  uint64_t v126;
  const __CFString *v127;
  id v128;
  id v129;
  SBMainDisplayLayoutStateManager *v130;
  int v131;
  void *v132;
  int v133;
  int v134;
  id v135;
  uint64_t *v136;
  id v137;
  id v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD v143[4];
  id v144;
  int v145;
  id v146;
  __int16 v147;
  id v148;
  __int16 v149;
  void *v150;
  _BYTE v151[128];
  uint64_t v152;

  v116 = a6;
  v12 = a5;
  v152 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = (__CFString *)a4;
  v129 = a7;
  v128 = a8;
  v135 = a9;
  v98 = a10;
  v130 = self;
  -[SBMainDisplayLayoutStateManager _recentAppLayouts](self, "_recentAppLayouts");
  v97 = (id)objc_claimAutoreleasedReturnValue();
  v137 = v15;
  objc_msgSend(v97, "recentsForBundleIdentifier:includingHiddenAppLayouts:", v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  v123 = v16;
  v126 = v18;
  if (v16 || !v18)
  {
    objc_msgSend(v97, "recentsForBundleIdentifier:includingHiddenAppLayouts:", v137, 1);
    v19 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v19;
  }
  if (v98)
  {
    v143[0] = MEMORY[0x1E0C809B0];
    v143[1] = 3221225472;
    v143[2] = __216__SBMainDisplayLayoutStateManager_defaultSceneIdentifierForBundleIdentifier_targetContentIdentifier_allowCanMatches_preferNewScene_visibleSceneIdentifiers_excludingSceneIdentifiers_sceneSessionRole_preferredDisplay___block_invoke;
    v143[3] = &unk_1E8E9DF78;
    v144 = v98;
    objc_msgSend(v17, "bs_filter:", v143);
    v20 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v20;
  }
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  v103 = v17;
  v110 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v139, v151, 16);
  if (v110)
  {
    v101 = 0;
    v105 = 0;
    v22 = &stru_1E8EC7EC0;
    if (v123)
      v22 = v123;
    v112 = v22;
    v104 = !v12;
    v117 = 10;
    v108 = 80;
    v109 = *(_QWORD *)v140;
    v100 = 4;
    v102 = 1;
    v99 = 2;
    v127 = CFSTR("sceneSessionRole");
    v115 = CFSTR("activationConditions");
    *(_QWORD *)&v21 = 138543874;
    v107 = v21;
    *(_QWORD *)&v21 = 138543619;
    v96 = v21;
    *(_QWORD *)&v21 = 138543618;
    v106 = v21;
LABEL_10:
    v23 = 0;
LABEL_11:
    if (*(_QWORD *)v140 != v109)
      objc_enumerationMutation(v103);
    v24 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v23);
    if (v123
      && (objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = objc_msgSend(v25, "userInterfaceIdiom"),
          v25,
          (v26 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      || !objc_msgSend(v24, "isHidden", (_QWORD)v96, *((_QWORD *)&v96 + 1))
      || !-[SBMainDisplayLayoutStateManager _hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:](v130, "_hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:", v24))
    {
      MEMORY[0x1E0C80A78]();
      v28 = (uint64_t *)((char *)&v96 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
      +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "switcherControllerForAppLayout:", v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v113 = v30;
      v31 = objc_msgSend(v30, "windowManagementStyle");
      v114 = &v96;
      if (v31 == 2)
      {
        v34 = v23;
        objc_msgSend(v24, "zOrderedItems");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v35, "count");
        if (v33 >= 1 && v117 != 0)
        {
          v37 = 0;
          do
          {
            objc_msgSend(v35, "objectAtIndex:", v37, (_QWORD)v96);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v28[v37] = objc_msgSend(v24, "layoutRoleForItem:", v38);

            ++v37;
          }
          while ((uint64_t)v37 < v33 && v37 < v117);
        }

        v32 = v126;
        v23 = v34;
        if (v33 < 1)
        {
LABEL_29:

          goto LABEL_96;
        }
      }
      else if (v31 == 1)
      {
        v39 = v102;
        *v28 = v100;
        v28[1] = v39;
        v33 = 3;
        v28[2] = v99;
        v32 = v126;
      }
      else
      {
        v32 = v126;
        if (v31)
          goto LABEL_29;
        *v28 = v102;
        v33 = 1;
      }
      v111 = v23;
      v124 = 0;
      v132 = v24;
      while (1)
      {
        v40 = *v28++;
        objc_msgSend(v24, "itemForLayoutRole:", v40, (_QWORD)v96);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v41)
          break;
LABEL_94:

        if (!--v33)
        {

          v23 = v111;
          v87 = v124;
          if (v124)
            goto LABEL_100;
LABEL_96:
          if (++v23 == v110)
          {
            v110 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v139, v151, 16);
            if (!v110)
              goto LABEL_98;
            goto LABEL_10;
          }
          goto LABEL_11;
        }
      }
      objc_msgSend(v41, "uniqueIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v128, "containsObject:", v43);
      v45 = objc_msgSend(v129, "containsObject:", v43);
      v136 = v28;
      v134 = v45;
      if (v32)
        v133 = objc_msgSend(v24, "isHidden");
      else
        v133 = 0;
      -[SBMainDisplayLayoutStateManager _applicationController](v130, "_applicationController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "applicationWithBundleIdentifier:", v137);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "_dataStore");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "uniqueIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "sceneStoreForIdentifier:creatingIfNecessary:", v49, 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v50, "objectForKey:", v127);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      if (v135 && v51 && !objc_msgSend(v51, "isEqual:", v135))
      {
LABEL_93:

        v24 = v132;
        v28 = v136;
        goto LABEL_94;
      }
      v131 = v44;
      objc_msgSend(v42, "bundleIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v137, "isEqualToString:", v53);

      if (!v54)
        goto LABEL_92;
      if (__sb__runningInSpringBoard())
      {
        v55 = SBFEffectiveDeviceClass();
        if (!v123 || v55 != 2)
          goto LABEL_48;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "userInterfaceIdiom");

        if (v57 != 1 || !v123)
        {
LABEL_48:
          if (((v131 | v134 | v116 | v133) & 1) == 0)
          {
            v63 = v124;
            if (v124)
              v64 = v124;
            else
              v64 = v43;
            v65 = v64;
            v66 = v63;
            v67 = v65;
LABEL_91:

            v124 = v67;
          }
LABEL_92:
          v32 = v126;
          goto LABEL_93;
        }
      }
      v118 = v47;
      objc_msgSend(v50, "objectForKey:", v115);
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = (void *)MEMORY[0x1E0CB3710];
      v60 = objc_opt_class();
      v119 = (void *)v58;
      objc_msgSend(v59, "unarchivedObjectOfClass:fromData:error:", v60, v58, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = v61;
      if (v61)
        v62 = v61;
      else
        v62 = objc_alloc_init(MEMORY[0x1E0CEA920]);
      v125 = v62;
      v68 = v123;
      +[SBFocusAppConfigurationContextMonitor sharedInstance](SBFocusAppConfigurationContextMonitor, "sharedInstance");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "targetContentIdentifierPrefixForBundleIdentifier:", v137);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v118;
      v121 = v70;
      if (v70)
      {
        SBLogCommon();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          v145 = v106;
          v146 = v137;
          v147 = 2114;
          v148 = v121;
          _os_log_impl(&dword_1D0540000, v71, OS_LOG_TYPE_DEFAULT, "Found TCI Prefix for scene evaluation %{public}@:%{public}@", (uint8_t *)&v145, 0x16u);
        }

        objc_msgSend(v121, "stringByAppendingString:", v112);
        v72 = objc_claimAutoreleasedReturnValue();

        v73 = (id)v72;
      }
      else
      {
        v73 = v68;
      }
      v74 = v125;
      v138 = 0;
      v75 = v73;
      v76 = objc_msgSend(v125, "_suitabilityForTargetContentIdentifier:errorString:");
      v122 = v138;
      v125 = v74;
      if (v76 != 2)
      {
        if (v76 == 1)
        {
          if (((v131 | v134 | v104 | v133) & 1) == 0)
          {
            v82 = v105;
            if (v105)
              v83 = v105;
            else
              v83 = v43;
            v84 = v83;

            v105 = v84;
          }
          SBLogCommon();
          v77 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            goto LABEL_85;
          v145 = v107;
          v146 = v43;
          v147 = 2114;
          v148 = v120;
          v149 = 2114;
          v150 = v75;
          v78 = v77;
          v79 = "Scene is suitable for activationConditions %{public}@:%{public}@ %{public}@";
          goto LABEL_84;
        }
        if (v76)
        {
LABEL_86:
          v67 = v124;
          if (v122)
          {
            SBLogCommon();
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
            {
              v145 = v96;
              v146 = v137;
              v147 = 2113;
              v148 = v122;
              _os_log_error_impl(&dword_1D0540000, v86, OS_LOG_TYPE_ERROR, "error evaluating UISceneActivationConditions for %{public}@: %{private}@", (uint8_t *)&v145, 0x16u);
            }

          }
          v66 = v119;
          goto LABEL_91;
        }
        SBLogCommon();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          v145 = v107;
          v146 = v43;
          v147 = 2114;
          v148 = v120;
          v149 = 2114;
          v150 = v75;
          v78 = v77;
          v79 = "Scene is not suitable for activationConditions %{public}@:%{public}@ %{public}@";
LABEL_84:
          _os_log_impl(&dword_1D0540000, v78, OS_LOG_TYPE_DEFAULT, v79, (uint8_t *)&v145, 0x20u);
          goto LABEL_85;
        }
        goto LABEL_85;
      }
      if (((v131 | v134) & 1) != 0)
      {
        if (((v131 | v134 ^ 1) & 1) != 0)
          goto LABEL_82;
        v80 = v101;
        if (v101)
          v81 = v101;
        else
          v81 = v43;
        v101 = v81;
      }
      else
      {
        v80 = v124;
        if (v124)
          v81 = v124;
        else
          v81 = v43;
        v124 = v81;
      }
      v85 = v81;

LABEL_82:
      SBLogCommon();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v145 = v107;
        v146 = v43;
        v147 = 2114;
        v148 = v120;
        v149 = 2114;
        v150 = v75;
        v78 = v77;
        v79 = "Scene is preferred for activationConditions %{public}@:%{public}@ %{public}@";
        goto LABEL_84;
      }
LABEL_85:

      goto LABEL_86;
    }
LABEL_98:
    v87 = 0;
  }
  else
  {
    v101 = 0;
    v87 = 0;
    v105 = 0;
  }
LABEL_100:
  v88 = v103;
  v89 = v87;

  v90 = v105;
  v91 = v101;
  if (v105)
    v92 = v105;
  else
    v92 = v101;
  if (v89)
    v93 = v89;
  else
    v93 = v92;
  v94 = v93;

  return v94;
}

- (SBApplicationController)_applicationController
{
  return +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
}

uint64_t __216__SBMainDisplayLayoutStateManager_defaultSceneIdentifierForBundleIdentifier_targetContentIdentifier_allowCanMatches_preferNewScene_visibleSceneIdentifiers_excludingSceneIdentifiers_sceneSessionRole_preferredDisplay___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "preferredDisplayIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

+ (Class)_layoutStateClass
{
  return (Class)objc_opt_class();
}

+ (id)_initialLayoutStateWithDisplayOrdinal:(int64_t)a3 isDisplayExternal:(BOOL)a4
{
  id v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_alloc((Class)objc_msgSend(a1, "_layoutStateClass"));
  LOBYTE(v10) = a4;
  LOBYTE(v9) = 0;
  LOBYTE(v8) = 0;
  return objc_autoreleaseReturnValue((id)objc_msgSend(v6, "_initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:spaceConfiguration:elementIdentifiersToLayoutAttributes:floatingConfiguration:unlockedEnvironmentMode:floatingSwitcherVisible:centerConfiguration:centerEntityModal:peekConfiguration:bundleIDShowingAppExpose:windowPickerRole:displayOrdinal:isDisplayExternal:", 0, 0, 0, 0, MEMORY[0x1E0C9AA70], 0, 1, v8, 0, v9, 0, 0, 0,
                                           a3,
                                           v10));
}

- (id)defaultSceneIdentifierForBundleIdentifier:(id)a3 targetContentIdentifier:(id)a4 allowCanMatches:(BOOL)a5 preferNewScene:(BOOL)a6 visibleSceneIdentifiers:(id)a7 excludingSceneIdentifiers:(id)a8 sceneSessionRole:(id)a9
{
  return -[SBMainDisplayLayoutStateManager defaultSceneIdentifierForBundleIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:visibleSceneIdentifiers:excludingSceneIdentifiers:sceneSessionRole:preferredDisplay:](self, "defaultSceneIdentifierForBundleIdentifier:targetContentIdentifier:allowCanMatches:preferNewScene:visibleSceneIdentifiers:excludingSceneIdentifiers:sceneSessionRole:preferredDisplay:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (id)primarySceneIdentifierForBundleIdentifier:(id)a3 sceneSessionRole:(id)a4 displayIdentity:(id)a5
{
  id v8;
  void *v9;
  _BOOL4 IsValid;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  _BOOL4 v28;
  int v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  SBMainDisplayLayoutStateManager *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v50 = a4;
  v8 = a5;
  v52 = self;
  -[SBMainDisplayLayoutStateManager _layoutStateForDisplayIdentity:](self, "_layoutStateForDisplayIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IsValid = SBPeekConfigurationIsValid(objc_msgSend(v9, "peekConfiguration"));
  objc_msgSend(v9, "appLayout");
  v11 = 0;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49 && !IsValid)
  {
    -[SBMainDisplayLayoutStateManager _sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:bundleIdentifier:sceneSessionRole:](self, "_sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:bundleIdentifier:sceneSessionRole:", v49, v51, v50);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "floatingAppLayout");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v11)
  {
    v16 = !v12 || IsValid;
    if (v16
      || (-[SBMainDisplayLayoutStateManager _sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:bundleIdentifier:sceneSessionRole:](v52, "_sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:bundleIdentifier:sceneSessionRole:", v12, v51, v50), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[SBMainDisplayLayoutStateManager _recentAppLayouts](v52, "_recentAppLayouts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "recentsForBundleIdentifier:includingHiddenAppLayouts:", v51, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v13;
      if (!objc_msgSend(v18, "count"))
      {
        objc_msgSend(v17, "recentsForBundleIdentifier:includingHiddenAppLayouts:", v51, 1);
        v19 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v19;
      }
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      if (v21)
      {
        v22 = v21;
        v46 = v17;
        v23 = v9;
        v24 = v8;
        v25 = *(_QWORD *)v58;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v58 != v25)
              objc_enumerationMutation(v20);
            v27 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            if (objc_msgSend(v27, "isHidden"))
              v28 = -[SBMainDisplayLayoutStateManager _hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:](v52, "_hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:", v27);
            else
              v28 = 0;
            if ((objc_msgSend(v49, "isOrContainsAppLayout:", v27) & 1) != 0)
              v29 = 1;
            else
              v29 = objc_msgSend(v48, "isOrContainsAppLayout:", v27);
            if (((v28 | IsValid & v29) & 1) == 0)
            {
              -[SBMainDisplayLayoutStateManager _sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:bundleIdentifier:sceneSessionRole:](v52, "_sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:bundleIdentifier:sceneSessionRole:", v27, v51, v50);
              v30 = objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                v11 = (void *)v30;
                goto LABEL_30;
              }
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
          if (v22)
            continue;
          break;
        }
        v11 = 0;
LABEL_30:
        v8 = v24;
        v9 = v23;
        v17 = v46;
      }
      else
      {
        v11 = 0;
      }

      v31 = v11 || IsValid;
      v13 = v48;
      if (!v31)
      {
        v45 = v9;
        v47 = v8;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        -[SBMainDisplayLayoutStateManager _sceneManagerForDisplayIdentity:](v52, "_sceneManagerForDisplayIdentity:", v8);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "externalApplicationSceneHandles");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = v33;
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        if (!v35)
        {
          v11 = 0;
          goto LABEL_51;
        }
        v36 = v35;
        v11 = 0;
        v37 = *(_QWORD *)v54;
        v38 = v51;
        while (1)
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v54 != v37)
              objc_enumerationMutation(v34);
            v40 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
            objc_msgSend(v40, "application");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "bundleIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v42, "isEqual:", v38) & 1) == 0)
            {

              goto LABEL_45;
            }
            objc_msgSend(v40, "sceneIdentifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = -[SBMainDisplayLayoutStateManager _doesSceneIDSpecifyPrimaryScene:forApplicationIdentifier:sceneSessionRole:](v52, "_doesSceneIDSpecifyPrimaryScene:forApplicationIdentifier:sceneSessionRole:", v43, v38, v50);

            if (v44)
            {
              objc_msgSend(v40, "sceneIdentifier");
              v41 = v11;
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v51;
LABEL_45:

              continue;
            }
            v38 = v51;
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          if (!v36)
          {
LABEL_51:

            v9 = v45;
            v8 = v47;
            v13 = v48;
            break;
          }
        }
      }
    }
  }
  v14 = v11;

  return v14;
}

- (BOOL)_doesSceneIDSpecifyPrimaryScene:(id)a3 forApplicationIdentifier:(id)a4 sceneSessionRole:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v29;
  __CFString *v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  __CFString *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  -[SBMainDisplayLayoutStateManager _applicationController](self, "_applicationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationWithBundleIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_dataStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sceneStoreForIdentifier:creatingIfNecessary:", v8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKey:", CFSTR("activationConditions"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v21 = 1;
    if (!v10)
      goto LABEL_23;
    goto LABEL_18;
  }
  v30 = v8;
  +[SBFocusAppConfigurationContextMonitor sharedInstance](SBFocusAppConfigurationContextMonitor, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "targetContentIdentifierPrefixForBundleIdentifier:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v12;
  if (v18)
  {
    v19 = v18;
    SBLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = v9;
      v34 = 2114;
      v35 = v19;
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Found TCI Prefix for primary scene evaluation %{public}@:%{public}@", buf, 0x16u);
    }

  }
  else
  {
    v19 = &stru_1E8EC7EC0;
  }
  v31 = 0;
  v22 = objc_msgSend(v16, "_suitabilityForTargetContentIdentifier:errorString:", v19, &v31);
  v23 = v31;
  v21 = v22 != 0;
  if (!v22)
  {
    SBLogCommon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v33 = v9;
      v34 = 2114;
      v35 = v30;
      v36 = 2114;
      v37 = v16;
      _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Scene is not suitable for primary role %{public}@:%{public}@ %{public}@", buf, 0x20u);
    }

  }
  if (v23)
  {
    SBLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SBMainDisplayLayoutStateManager _doesSceneIDSpecifyPrimaryScene:forApplicationIdentifier:sceneSessionRole:].cold.1((uint64_t)v9, (uint64_t)v23, v25);

  }
  v12 = v29;
  v8 = v30;
  if (v10)
  {
LABEL_18:
    if (v21)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("sceneSessionRole"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
        LOBYTE(v21) = objc_msgSend(v26, "isEqualToString:", v10);
      else
        LOBYTE(v21) = 1;

    }
  }
LABEL_23:

  return v21;
}

- (id)_sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier:(id)a3 bundleIdentifier:(id)a4 sceneSessionRole:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  SBMainDisplayLayoutStateManager *v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __130__SBMainDisplayLayoutStateManager__sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier_bundleIdentifier_sceneSessionRole___block_invoke;
  v15[3] = &unk_1E8EB1B30;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a3, "latestItemPassingTest:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __130__SBMainDisplayLayoutStateManager__sceneIDIfAppLayoutContainsPrimarySceneIDForBundleIdentifier_bundleIdentifier_sceneSessionRole___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    v6 = (void *)a1[5];
    objc_msgSend(v3, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "_doesSceneIDSpecifyPrimaryScene:forApplicationIdentifier:sceneSessionRole:", v7, a1[4], a1[6]);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __131__SBMainDisplayLayoutStateManager__mostRecentAppLayoutMatchingAnyUniqueIdentifier_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v6 = v3;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __131__SBMainDisplayLayoutStateManager__mostRecentAppLayoutMatchingAnyUniqueIdentifier_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v6 = v3;
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

- (id)_mostRecentAppLayoutForBundleIdentifier:(id)a3 ignoringUniqueIdentifiers:(id)a4 chamoisWindowingUIEnabled:(BOOL)a5 multitaskingSupported:(BOOL)a6
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  _BOOL4 v25;
  _BOOL4 v27;
  SBMainDisplayLayoutStateManager *v28;
  id obj;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  int v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint64_t *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  id v46;
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v27 = a6;
  v59 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v34 = a4;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v28 = self;
  -[SBMainDisplayLayoutStateManager _recentAppLayouts](self, "_recentAppLayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recentsIncludingHiddenAppLayouts:", 0);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v35)
  {
    v9 = 0;
    v32 = *(_QWORD *)v54;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v32)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v10);
      v49 = 0;
      v50 = &v49;
      v51 = 0x2020000000;
      v52 = 0;
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __149__SBMainDisplayLayoutStateManager__mostRecentAppLayoutForBundleIdentifier_ignoringUniqueIdentifiers_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke;
      v45[3] = &unk_1E8EB1B80;
      v45[4] = v11;
      v12 = v33;
      v46 = v12;
      v13 = v34;
      v47 = v13;
      v48 = &v49;
      SBLayoutRoleEnumerateAppLayoutRoles(v45);
      v14 = *((unsigned __int8 *)v50 + 24);
      if (*((_BYTE *)v50 + 24))
      {
        v36 = *((unsigned __int8 *)v50 + 24);
        v15 = v11;

        if (SBFIsChamoisWindowingUIAvailable() && !a5)
        {
          -[SBMainDisplayLayoutStateManager _applicationController](v28, "_applicationController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:multitaskingSupported:", v16, v27);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = v31;
          if (v31)
          {
            *((_BYTE *)v50 + 24) = 0;
            v41 = 0u;
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v18 = v31;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
            if (v19)
            {
              v20 = *(_QWORD *)v42;
LABEL_12:
              v21 = 0;
              while (1)
              {
                if (*(_QWORD *)v42 != v20)
                  objc_enumerationMutation(v18);
                v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v21);
                v37[0] = MEMORY[0x1E0C809B0];
                v37[1] = 3221225472;
                v37[2] = __149__SBMainDisplayLayoutStateManager__mostRecentAppLayoutForBundleIdentifier_ignoringUniqueIdentifiers_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke_2;
                v37[3] = &unk_1E8EB1B80;
                v37[4] = v22;
                v38 = v12;
                v39 = v13;
                v40 = &v49;
                SBLayoutRoleEnumerateAppLayoutRoles(v37);
                v23 = *((unsigned __int8 *)v50 + 24);
                if (*((_BYTE *)v50 + 24))
                {
                  v24 = v22;

                  v15 = v24;
                }

                if (v23)
                  break;
                if (v19 == ++v21)
                {
                  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
                  if (v19)
                    goto LABEL_12;
                  break;
                }
              }
            }

            v17 = v31;
          }

        }
        v9 = v15;
        v14 = v36;
      }
      v25 = v14 == 0;

      _Block_object_dispose(&v49, 8);
      if (!v25)
        break;
      if (++v10 == v35)
      {
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        if (v35)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __149__SBMainDisplayLayoutStateManager__mostRecentAppLayoutForBundleIdentifier_ignoringUniqueIdentifiers_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v9 = v3;
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(v9, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v6, "containsObject:", v7);

    v8 = v9;
    if ((v6 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {

    v8 = v9;
  }

}

void __149__SBMainDisplayLayoutStateManager__mostRecentAppLayoutForBundleIdentifier_ignoringUniqueIdentifiers_chamoisWindowingUIEnabled_multitaskingSupported___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v9 = v3;
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(v9, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v6, "containsObject:", v7);

    v8 = v9;
    if ((v6 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {

    v8 = v9;
  }

}

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "isPreviousWorkspaceEntity"))
    goto LABEL_22;
  v7 = objc_msgSend(v5, "previousLayoutRole");
  if (v7)
  {
    objc_msgSend(a1[4], "previousEntityForLayoutRole:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "copy");

    if (!v8)
    {
LABEL_22:
      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
  }
  else
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    if (!v8)
      goto LABEL_22;
  }
  v10 = objc_msgSend(v8, "layoutRole");
  if (objc_msgSend(a1[5], "isAnalogousToEntity:", v8))
    v11 = objc_msgSend(a1[5], "layoutRole") != v10;
  else
    v11 = 0;
  if (objc_msgSend(a1[6], "isAnalogousToEntity:", v8))
    v12 = objc_msgSend(a1[6], "layoutRole") != v10;
  else
    v12 = 0;
  if (objc_msgSend(a1[7], "isAnalogousToEntity:", v8))
    v13 = objc_msgSend(a1[7], "layoutRole") != v10;
  else
    v13 = 0;
  if (objc_msgSend(a1[8], "isAnalogousToEntity:", v8))
    v14 = objc_msgSend(a1[8], "layoutRole") != v10;
  else
    v14 = 0;
  if (v11 || v12 || v13 || v14)
  {

    goto LABEL_22;
  }
  objc_msgSend(v8, "clearActivationSettings");
  objc_msgSend(v5, "activationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyActivationSettings:", v15);

  objc_msgSend(v8, "clearDeactivationSettings");
  objc_msgSend(v5, "deactivationSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyDeactivationSettings:", v16);

LABEL_23:
  return v8;
}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_3(uint64_t a1, unint64_t a2)
{
  BOOL v2;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v2 = a2 == 1 || a2 == 2;
  if (!v2 && SBLayoutRoleIsValidForSplitView(a2))
  {
    objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", a2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v18 = (id)v5;
      objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        v9 = *(id *)(a1 + 40);
      }
      else
      {
        v10 = *(void **)(a1 + 48);
        objc_msgSend(v18, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_applicationSceneEntityFromApplicationBundleIdentifier:uniqueIdentifier:displayIdentity:", v11, v12, *(_QWORD *)(a1 + 56));
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 72);
        v16 = *(_QWORD *)(a1 + 48);
        SBLayoutRoleDescription(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v15, v16, CFSTR("SBMainDisplayLayoutStateManager.m"), 764, CFSTR("Failed to create additional side workspace entity from app layout's role: %@!"), v17);

        v13 = v18;
        goto LABEL_15;
      }

LABEL_14:
      objc_msgSend(*(id *)(a1 + 64), "setEntity:forLayoutRole:", v9, a2);
      v13 = v9;
LABEL_15:

      return;
    }
    +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_14;
  }
}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v2 = 0;
  else
    v2 = a2 > 1;
  if (v2 && SBLayoutRoleIsValidForSplitView(a2))
  {
    objc_msgSend(*(id *)(a1 + 32), "entityForLayoutRole:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      || (objc_msgSend(*(id *)(a1 + 32), "previousEntityForLayoutRole:", a2),
          (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = v5;
      v6 = objc_msgSend(v5, "isEmptyWorkspaceEntity");
      v7 = v8;
      if (!v6)
        goto LABEL_14;
    }
    else
    {
      v7 = 0;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
LABEL_14:

  }
}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_5(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v2 = 0;
  else
    v2 = a2 >= 1;
  if (v2 && SBLayoutRoleIsValidForSplitView(a2))
  {
    objc_msgSend(*(id *)(a1 + 32), "entityForLayoutRole:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5 || (v8 = v5, v7 = objc_msgSend(v5, "isEmptyWorkspaceEntity"), v6 = v8, v7))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

  }
}

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "isPreviousWorkspaceEntity"))
    goto LABEL_7;
  v7 = objc_msgSend(v5, "previousLayoutRole");
  v8 = v6;
  if (v7)
  {
    if (v7 != 1)
    {
LABEL_7:
      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v8 = *(void **)(a1 + 32);
  }
  v9 = (void *)objc_msgSend(v8, "copy");
  if (!v9)
    goto LABEL_7;
  v10 = v9;
  objc_msgSend(v9, "clearActivationSettings");
  objc_msgSend(v5, "activationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applyActivationSettings:", v11);

  objc_msgSend(v10, "clearDeactivationSettings");
  objc_msgSend(v5, "deactivationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applyDeactivationSettings:", v12);

LABEL_8:
  return v10;
}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_50(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "elementWithRole:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForElement:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workspaceEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationSceneEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "lastInteractionTime");
  if (v5)
  {
    v7 = v6;
    if (v6 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
    }
  }

}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_2_51(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "previousApplicationSceneEntityForLayoutRole:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40));

    v3 = v6;
  }

}

void __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_3_60(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  id v23;
  id v24;

  if (a2 >= 5)
  {
    objc_msgSend(*(id *)(a1 + 32), "entityForLayoutRole:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v22 = v4;
      v5 = objc_msgSend(v4, "isPreviousWorkspaceEntity");
      v6 = v22;
      if ((v5 & 1) == 0)
        goto LABEL_8;
    }
    else
    {
      +[SBPreviousWorkspaceEntity entityWithPreviousLayoutRole:](SBPreviousWorkspaceEntity, "entityWithPreviousLayoutRole:", a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = v6;
    v7 = *(_QWORD *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 32), "previousEntityForLayoutRole:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v23, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
LABEL_8:
    v24 = v6;
    v10 = objc_msgSend(v6, "isEmptyWorkspaceEntity");
    v11 = v24;
    if ((v10 & 1) == 0)
    {
      v12 = objc_msgSend(v24, "isHomeScreenEntity");
      v11 = v24;
      if ((v12 & 1) == 0)
      {
        if (!v24)
          return;
        v13 = *(void **)(a1 + 40);
        if (v13)
        {
          v14 = objc_msgSend(v13, "isAnalogousToEntity:", v24);
          v11 = v24;
          if ((v14 & 1) != 0)
            goto LABEL_19;
        }
        v15 = *(void **)(a1 + 48);
        if (v15)
        {
          v16 = objc_msgSend(v15, "isAnalogousToEntity:", v11);
          v11 = v24;
          if ((v16 & 1) != 0)
            goto LABEL_19;
        }
        if ((v17 = *(void **)(a1 + 56)) != 0
          && (v18 = objc_msgSend(v17, "isAnalogousToEntity:", v11), v11 = v24, (v18 & 1) != 0)
          || (v19 = *(void **)(a1 + 64)) != 0
          && (v20 = objc_msgSend(v19, "isAnalogousToEntity:", v11), v11 = v24, (v20 & 1) != 0))
        {
LABEL_19:
          objc_msgSend(*(id *)(a1 + 32), "setEntity:forLayoutRole:", 0, a2);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "setEntity:forLayoutRole:", v11, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
          (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(*(id *)(a1 + 72), "addObject:", v21);
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
          }

        }
        v11 = v24;
      }
    }

  }
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_4_62(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_5_63(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "type"))
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "containsItemWithBundleIdentifier:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_6_64(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "lastInteractionTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "lastInteractionTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "compare:", v13);

  return v14;
}

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_9;
  v11[3] = &unk_1E8EB1238;
  v5 = v3;
  v12 = v5;
  objc_msgSend(v4, "bs_firstObjectPassingTest:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "workspaceEntity");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(v3, "layoutRole") == 4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(v3, "layoutRole") == 3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __79__SBMainDisplayLayoutStateManager__layoutStateForApplicationTransitionContext___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (SBPlatformController)_platformController
{
  return +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
}

- (id)_layoutStateForDisplayIdentity:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)SBApp;
  v4 = a3;
  objc_msgSend(v3, "windowSceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowSceneForDisplayIdentity:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layoutStateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_sceneManagerForDisplayIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneManagerForDisplayIdentity:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_hasAppLayoutBeenUserKilledWithinThresholdToCreateNewScene:", v3);

  return v5;
}

- (id)_applicationSceneEntityFromApplicationBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4 displayIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  SBDeviceApplicationSceneEntity *v13;
  void *v14;
  SBDeviceApplicationSceneEntity *v15;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[SBMainDisplayLayoutStateManager _applicationController](self, "_applicationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationWithBundleIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = [SBDeviceApplicationSceneEntity alloc];
    -[SBMainDisplayLayoutStateManager _sceneManagerForDisplayIdentity:](self, "_sceneManagerForDisplayIdentity:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v13, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v12, v8, v14, v9);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_doesSceneIDSpecifyPrimaryScene:(uint64_t)a1 forApplicationIdentifier:(uint64_t)a2 sceneSessionRole:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Error decoding activation conditions for %{public}@:%{public}@", (uint8_t *)&v3, 0x16u);
}

@end
