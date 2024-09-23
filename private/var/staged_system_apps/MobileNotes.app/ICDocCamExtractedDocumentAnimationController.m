@implementation ICDocCamExtractedDocumentAnimationController

- (ICDocCamExtractedDocumentAnimationController)initWithPresentedController:(id)a3 presentingController:(id)a4 thumbnailView:(id)a5 duration:(double)a6 isPresenting:(BOOL)a7
{
  _BOOL8 v7;
  id v10;
  ICDocCamExtractedDocumentAnimationController *v11;
  ICDocCamExtractedDocumentAnimationController *v12;
  objc_super v14;

  v7 = a7;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICDocCamExtractedDocumentAnimationController;
  v11 = -[ICDocCamExtractedDocumentAnimationController init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[ICDocCamExtractedDocumentAnimationController setDuration:](v11, "setDuration:", a6);
    -[ICDocCamExtractedDocumentAnimationController setIsPresenting:](v12, "setIsPresenting:", v7);
    -[ICDocCamExtractedDocumentAnimationController setThumbnailView:](v12, "setThumbnailView:", v10);
  }

  return v12;
}

- (void)animateTransition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  if (-[ICDocCamExtractedDocumentAnimationController isPresenting](self, "isPresenting"))
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v9 = objc_opt_class(UINavigationController);
  v10 = ICDynamicCast(v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));

  if (-[ICDocCamExtractedDocumentAnimationController isPresenting](self, "isPresenting"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "containerView"));
    objc_msgSend(v14, "addSubview:", v8);

  }
  objc_msgSend(v15, "finalFrameForViewController:", v7);
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "setNeedsDisplay");
  objc_msgSend(v8, "setNeedsLayout");
  objc_msgSend(v8, "layoutIfNeeded");
  objc_msgSend(v13, "setNeedsDisplay");
  objc_msgSend(v13, "setNeedsLayout");
  objc_msgSend(v13, "layoutIfNeeded");
  -[ICDocCamExtractedDocumentAnimationController animatePresentationOrDismissalTransition:](self, "animatePresentationOrDismissalTransition:", v15);

}

- (void)animatePresentationOrDismissalTransition:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  ICDocCamExtractedDocumentAnimationController *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  _BOOL4 v114;
  void *v115;
  CGFloat v116;
  _UNKNOWN **v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  unsigned int v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  void *v131;
  id v132;
  double v133;
  uint64_t v134;
  void *v135;
  void *v136;
  id v137;
  double v138;
  double v139;
  double MaxPoint;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  unsigned int v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  unsigned int v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  void *v183;
  double v184;
  uint64_t v185;
  double v186;
  void *v187;
  void *v188;
  id v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  double v213;
  double v214;
  double v215;
  CGFloat v216;
  double MinX;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  _BOOL4 v225;
  _BOOL4 v226;
  double v227;
  unsigned int v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double MaxY;
  double v242;
  double v243;
  double v244;
  double v245;
  void *v246;
  void *v247;
  id v248;
  id v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  id v257;
  char *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  id v264;
  id v265;
  void *v266;
  void *v267;
  void *v268;
  double v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  double v275;
  double v276;
  void *v277;
  double v278;
  double v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  void *v286;
  double v287;
  double v288;
  double v289;
  double v290;
  double v291;
  double v292;
  double v293;
  double v294;
  void *v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double v300;
  double v301;
  double v302;
  void *v303;
  void *v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double v314;
  double v315;
  double v316;
  void *v317;
  void *v318;
  double v319;
  double v320;
  void *v321;
  double v322;
  double v323;
  id v324;
  void *v325;
  double left;
  double right;
  double bottom;
  void *v329;
  void *v330;
  id v331;
  void *v332;
  double v333;
  double v334;
  double v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  uint64_t v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  double v354;
  double v355;
  double v356;
  double v357;
  double v358;
  double v359;
  double v360;
  double v361;
  void *v362;
  double v363;
  double v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  double v370;
  void *v371;
  double v372;
  double v373;
  double v374;
  double v375;
  double v376;
  double v377;
  double v378;
  double v379;
  void *v380;
  double v381;
  double v382;
  double v383;
  double v384;
  double v385;
  double v386;
  double v387;
  double v388;
  double v389;
  double v390;
  void *v391;
  void *v392;
  double v393;
  double v394;
  void *v395;
  double v396;
  double v397;
  _UNKNOWN **v398;
  void *v399;
  double v400;
  double v401;
  double v402;
  double v403;
  double v404;
  double v405;
  double v406;
  double v407;
  void *v408;
  double v409;
  double v410;
  double v411;
  double v412;
  double v413;
  double v414;
  double v415;
  double v416;
  void *v417;
  double v418;
  double v419;
  double v420;
  double v421;
  double v422;
  double v423;
  double v424;
  double v425;
  void *v426;
  double v427;
  double v428;
  double v429;
  double v430;
  double v431;
  double v432;
  double v433;
  double v434;
  double v435;
  double v436;
  void *v437;
  void *v438;
  double v439;
  double v440;
  void *v441;
  double v442;
  double v443;
  _UNKNOWN **v444;
  void *v445;
  uint64_t v446;
  id v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  id v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  id v462;
  id v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  id v468;
  id v469;
  void *v470;
  double top;
  double v472;
  void *v473;
  void *v474;
  void *v475;
  void *v476;
  void *v477;
  double v478;
  double v479;
  double v480;
  double v481;
  double v482;
  double v483;
  double v484;
  double v485;
  double v486;
  double v487;
  double v488;
  double v489;
  double v490;
  double v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  double v496;
  double v497;
  void *v498;
  void *v499;
  double v500;
  double v501;
  void *v502;
  void *v503;
  unsigned int v504;
  BOOL v505;
  void *v506;
  void *v507;
  void *v508;
  void *v509;
  void *v510;
  unsigned int v511;
  BOOL v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  unsigned int v520;
  BOOL v521;
  void *v522;
  void *v523;
  id v524;
  id v525;
  id v526;
  uint64_t v527;
  void *i;
  void *v529;
  double v530;
  id v531;
  id v532;
  id v533;
  uint64_t v534;
  void *j;
  void *v536;
  double v537;
  void *v538;
  double v539;
  double v540;
  double v541;
  void *v542;
  void *v543;
  double v544;
  double v545;
  id v546;
  void *v547;
  id v548;
  id v549;
  id v550;
  id v551;
  id v552;
  id v553;
  id v554;
  id v555;
  id v556;
  double v557;
  double v558;
  double v559;
  double v560;
  double v561;
  double v562;
  double v563;
  double v564;
  double v565;
  double v566;
  double v567;
  double v568;
  double v569;
  double v570;
  double v571;
  double v572;
  double v573;
  double v574;
  double v575;
  double v576;
  double v577;
  double v578;
  void *v579;
  double v580;
  double v581;
  double v582;
  double v583;
  double v584;
  void *v585;
  void *v586;
  double v587;
  double v588;
  double v589;
  double v590;
  double v591;
  double v592;
  double v593;
  CGFloat v594;
  double v595;
  _BOOL4 v596;
  double v597;
  double v598;
  double v599;
  double v600;
  double v601;
  double v602;
  double v603;
  CGFloat v604;
  double v605;
  double v606;
  double width;
  double height;
  void *v609;
  double v610;
  double v611;
  double v612;
  double v613;
  double v614;
  void *v615;
  double v616;
  double v617;
  double v618;
  void *v619;
  double v620;
  void *v621;
  double v622;
  double v623;
  void *v624;
  double v625;
  void *v626;
  unsigned int v627;
  id v628;
  id v629;
  BOOL v630;
  void *v631;
  double v632;
  void *v633;
  double v634;
  double v635;
  double x;
  double v637;
  double y;
  double v639;
  void *v640;
  void *v641;
  void *v642;
  void *v643;
  void *v644;
  CGFloat v645;
  void *v646;
  void *v647;
  void *v648;
  unsigned int v649;
  void *v650;
  void *v651;
  void *v652;
  double v653;
  double v654;
  void *v655;
  double v656;
  double v657;
  void *v658;
  void *v659;
  void *v660;
  void *r1;
  unsigned int v662;
  void *v663;
  double v664;
  double v665;
  double v666;
  double v667;
  double v668;
  CGSize size;
  void *v670;
  double v671;
  double v672;
  void *v673;
  void *v674;
  void *v675;
  void *v676;
  CGFloat v677;
  void *v678;
  id v679;
  double v680;
  CGFloat v681;
  void *v682;
  int v683;
  id v684;
  void *v685;
  void *v686;
  void *v687;
  ICDocCamExtractedDocumentAnimationController *v688;
  void *v689;
  _QWORD v690[4];
  id v691;
  id v692;
  id v693;
  id v694;
  id v695;
  ICDocCamExtractedDocumentAnimationController *v696;
  id v697;
  id v698;
  id v699;
  id v700;
  id v701;
  id v702;
  double v703;
  double v704;
  double v705;
  double v706;
  uint64_t v707;
  double v708;
  CGFloat v709;
  double v710;
  CGFloat v711;
  CGPoint v712;
  CGSize v713;
  char v714;
  _QWORD v715[4];
  id v716;
  id v717;
  ICDocCamExtractedDocumentAnimationController *v718;
  id v719;
  id v720;
  double v721;
  double v722;
  double v723;
  double v724;
  uint64_t v725;
  double v726;
  CGFloat v727;
  double v728;
  double v729;
  CGPoint origin;
  CGSize v731;
  char v732;
  __int128 v733;
  __int128 v734;
  __int128 v735;
  __int128 v736;
  __int128 v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  _BYTE v741[128];
  _BYTE v742[128];
  CGRect v743;
  CGRect v744;
  CGRect v745;
  CGRect v746;
  CGRect v747;
  CGRect v748;
  CGRect v749;
  CGRect v750;
  CGRect v751;
  CGRect v752;
  CGRect v753;
  CGRect v754;
  CGRect v755;
  CGRect v756;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  v6 = objc_msgSend(v5, "isSecureScreenShowing");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v689 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v9 = objc_opt_class(UINavigationController);
  v10 = ICDynamicCast(v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_opt_class(UINavigationController);
  v13 = ICDynamicCast(v12, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v688 = self;
  LODWORD(v5) = -[ICDocCamExtractedDocumentAnimationController isPresenting](self, "isPresenting");
  v15 = objc_opt_class(ICDocCamExtractedDocumentNavigationController);
  if ((_DWORD)v5)
  {
    v16 = ICDynamicCast(v15, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_opt_class(ICDocCamExtractedDocumentViewController);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewControllers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", 0));
    v21 = ICDynamicCast(v18, v20);
    v685 = (void *)objc_claimAutoreleasedReturnValue(v21);

  }
  else
  {
    v22 = ICDynamicCast(v15, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v23 = objc_opt_class(ICDocCamExtractedDocumentViewController);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewControllers"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
    v26 = ICDynamicCast(v23, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    v685 = v27;
    if (!objc_msgSend(v27, "documentCount"))
    {
      v53 = v689;
      -[ICDocCamExtractedDocumentAnimationController animateDismissalTransition:](v688, "animateDismissalTransition:", v689);
      v54 = v27;
      goto LABEL_335;
    }
  }
  v646 = v11;
  v676 = v17;
  v662 = v6;
  if (!v6)
  {
    v33 = -[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting");
    v34 = objc_opt_class(ICSplitViewController);
    if (v33)
    {
      v35 = ICDynamicCast(v34, v7);
      v31 = objc_claimAutoreleasedReturnValue(v35);
      v36 = objc_opt_class(ICBrowseAttachmentsCollectionController);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topViewController"));
      v38 = ICDynamicCast(v36, v37);
      v39 = objc_claimAutoreleasedReturnValue(v38);

      v32 = v685;
      if (v31 | v39)
        goto LABEL_12;
      v40 = objc_opt_class(ICSplitViewController);
      v41 = v7;
    }
    else
    {
      v42 = ICDynamicCast(v34, v8);
      v31 = objc_claimAutoreleasedReturnValue(v42);
      v43 = objc_opt_class(ICBrowseAttachmentsCollectionController);
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topViewController"));
      v45 = ICDynamicCast(v43, v44);
      v39 = objc_claimAutoreleasedReturnValue(v45);

      v32 = v685;
      if (v31 | v39)
        goto LABEL_12;
      v40 = objc_opt_class(ICSplitViewController);
      v41 = v8;
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "presentingViewController"));
    v47 = ICDynamicCast(v40, v46);
    v31 = objc_claimAutoreleasedReturnValue(v47);

LABEL_12:
    if (v31)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31, "ic_viewControllerManager"));
      v30 = objc_msgSend(v48, "noteContainerViewMode") == (id)1;

      if (!v39)
        goto LABEL_15;
    }
    else
    {
      v30 = 0;
      if (!v39)
      {
LABEL_15:
        v641 = (void *)v39;
        if (v31)
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31, "ic_viewControllerManager"));
          v675 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "noteEditorViewController"));
          v673 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v675, "navigationController"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "currentNoteBrowseViewController"));
          v649 = objc_msgSend(v51, "ic_isViewVisible");

          v658 = v50;
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "folderListViewController"));
          v627 = objc_msgSend(v52, "ic_isViewVisible");

          v630 = objc_msgSend((id)v31, "displayMode") == (id)4;
          v683 = 1;
        }
        else
        {
          v658 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v39, "ic_viewControllerManager"));
          v683 = 0;
          v630 = 0;
          v627 = 0;
          v649 = 0;
          v673 = 0;
          v675 = 0;
        }
        goto LABEL_21;
      }
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v39, "ic_viewControllerManager"));
    v30 = objc_msgSend(v49, "noteContainerViewMode") == (id)1;

    goto LABEL_15;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[ICQuickNoteSessionManager sharedManager](ICQuickNoteSessionManager, "sharedManager"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "noteEditorViewController"));

  v675 = v29;
  v673 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "navigationController"));
  v630 = 0;
  v627 = 0;
  v30 = 0;
  v649 = 0;
  v641 = 0;
  v31 = 0;
  v658 = 0;
  v683 = 1;
  v32 = v685;
LABEL_21:
  v55 = v688;
  v56 = objc_alloc_init((Class)NSMutableArray);
  v57 = objc_alloc_init((Class)NSMutableArray);
  v679 = objc_alloc_init((Class)NSMutableArray);
  v684 = objc_alloc_init((Class)NSMutableArray);
  v655 = v57;
  v686 = v56;
  if (-[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting"))
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    v59 = v56;
  }
  else
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    v59 = v57;
  }
  objc_msgSend(v59, "addObject:", v58);

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "indexPathForCurrentDocument"));
  v674 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "croppedAndFilteredmageForDocumentAtIndex:", objc_msgSend(v60, "item")));
  v640 = v60;
  if (-[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting"))
    objc_msgSend(v32, "zoomTargetForIndexPath:", v60);
  else
    objc_msgSend(v32, "imageRectWithZoomAndPanForIndexPath:", v60);
  v656 = v62;
  v657 = v61;
  v672 = v63;
  v671 = v64;
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v675, "ic_windowScene"));
  v682 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "statusBarManager"));

  v642 = v14;
  v643 = v8;
  v659 = (void *)v31;
  x = CGPointZero.x;
  y = CGPointZero.y;
  v644 = v7;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v601 = CGRectNull.origin.x;
  v605 = CGRectNull.origin.y;
  if (v683)
  {
    v66 = objc_opt_class(ICGalleryAttachmentViewCell);
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[ICDocCamExtractedDocumentAnimationController thumbnailView](v688, "thumbnailView"));
    v68 = ICDynamicCast(v66, v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue(v68);

    v70 = objc_opt_class(UICollectionView);
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "superview"));
    v72 = ICDynamicCast(v70, v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue(v72);

    objc_msgSend(v73, "bounds");
    v75 = v74;
    v77 = v76;
    v79 = v78;
    v81 = v80;
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31, "view"));
    v586 = v73;
    objc_msgSend(v73, "convertRect:toView:", v82, v75, v77, v79, v81);
    v677 = v83;
    v85 = v84;
    v87 = v86;
    v89 = v88;

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[ICDocCamExtractedDocumentAnimationController thumbnailView](v688, "thumbnailView"));
    objc_msgSend(v90, "bounds");
    v92 = v91;
    v94 = v93;
    v96 = v95;
    v98 = v97;

    v609 = v69;
    v670 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "imageView"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[ICDocCamExtractedDocumentAnimationController thumbnailView](v688, "thumbnailView"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31, "view"));
    objc_msgSend(v99, "convertRect:toView:", v100, v92, v94, v96, v98);
    v102 = v101;
    v104 = v103;
    v106 = v105;
    v108 = v107;

    objc_msgSend(v674, "size");
    v110 = v109;
    objc_msgSend(v674, "size");
    v112 = v110 / v111;
    v113 = v106 / v108;
    v632 = v112;
    v114 = v112 > ICGalleryAttachmentMaxAspectRatio || v112 < ICGalleryAttachmentMinAspectRatio;
    v115 = v679;
    v680 = v104;
    v645 = v108;
    v653 = v102;
    v654 = v106;
    v596 = v114;
    if (+[NSParagraphStyle ic_isRTL](NSParagraphStyle, "ic_isRTL"))
    {
      v664 = v102;
      v667 = v108;
      v668 = v106;
      if (v114)
      {
        if (v113 > 1.0)
        {
          v668 = v108 * v632;
          v664 = v102 + v106 - v108 * v632;
          v667 = v108;
        }
        else
        {
          v668 = v106;
          v664 = v102;
          v667 = v106 / v632;
        }
      }
      v743.origin.x = v677;
      v743.origin.y = v85;
      v743.size.width = v87;
      v743.size.height = v89;
      v753.origin.x = v102;
      v753.origin.y = v104;
      v753.size.width = v106;
      v753.size.height = v108;
      if (!CGRectIntersectsRect(v743, v753))
      {
        v660 = 0;
        r1 = 0;
        v678 = 0;
        v590 = CGPointZero.x;
        v591 = y;
        v587 = v605;
        v588 = height;
        v589 = CGRectNull.origin.x;
        v599 = CGPointZero.x;
        v600 = y;
        v597 = width;
        v598 = height;
        v595 = v605;
        v592 = width;
        v593 = CGRectNull.origin.x;
        goto LABEL_201;
      }
      v744.origin.x = v677;
      v744.origin.y = v85;
      v744.size.width = v87;
      v744.size.height = v89;
      v754.origin.x = v102;
      v754.origin.y = v104;
      v754.size.width = v106;
      v754.size.height = v108;
      v745 = CGRectIntersection(v744, v754);
      v119 = v745.origin.x;
      v120 = v745.size.width;
      v121 = v745.size.height;
      v122 = -[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting");
      if (v122)
        v123 = y;
      else
        v123 = 0.0;
      v600 = v123;
      if (v122)
        v124 = CGPointZero.x;
      else
        v124 = v119 - v664;
      if (v122)
        v125 = 0.0;
      else
        v125 = y;
      if (v122)
        v126 = v119 - v664;
      else
        v126 = CGPointZero.x;
      if (v122)
        v127 = v671;
      else
        v127 = v121;
      v598 = v127;
      v599 = v124;
      if (v122)
        v128 = v672;
      else
        v128 = v120;
      v597 = v128;
      if (v122)
        v129 = v121;
      else
        v129 = v671;
      if (v122)
        v130 = v120;
      else
        v130 = v672;
      v131 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
      objc_msgSend(v131, "setAnchorPoint:", 0.0, 0.0);
      objc_msgSend(v131, "setMasksToBounds:", 1);
      v678 = v131;
      if (v114)
      {
        v606 = v130;
        v132 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("gallery_fade_gradient")));
        v133 = v632;
        v622 = v129;
        if (v632 > 1.0)
        {
          v134 = objc_claimAutoreleasedReturnValue(+[UIImage ic_orientedImageFromImage:toOrientation:](UIImage, "ic_orientedImageFromImage:toOrientation:", v132, 3, v632));

          v132 = (id)v134;
        }
        v135 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer", v133));
        objc_msgSend(v135, "setAnchorPoint:", 0.0, 0.0);
        objc_msgSend(v135, "setContents:", objc_msgSend(v132, "ic_CGImage"));
        v136 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
        objc_msgSend(v136, "setAnchorPoint:", 0.0, 0.0);
        v137 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
        objc_msgSend(v136, "setBackgroundColor:", objc_msgSend(v137, "CGColor"));

        v660 = v136;
        objc_msgSend(v131, "addSublayer:", v136);
        r1 = v135;
        objc_msgSend(v131, "addSublayer:", v135);
        v138 = v121 * 0.1;
        if (v632 > 1.0)
          v138 = v654 * 0.055;
        v139 = round(v138);
        v611 = v125;
        if (v632 > 1.0)
        {
          v584 = v126;
          v32 = v685;
          if (v119 == v653 && v120 < v654)
          {
            v213 = 0.0;
            v214 = v139 + 0.0;
            v215 = v139;
            v216 = v645;
          }
          else
          {
            v225 = v120 < v654;
            v226 = v119 > v653;
            v213 = v120 - v654;
            v214 = v120 - v654 + v139;
            if (v226 && v225)
              v215 = v120 - v654 + v139;
            else
              v215 = v139;
            v216 = v645;
            if (!v226 || !v225)
              v216 = v121;
          }
          v634 = v216;
          v104 = v680;
          v227 = v120 - v215;
          v228 = -[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting");
          v229 = v600;
          if (!v228)
            v229 = 0.0;
          v617 = v229;
          v230 = v599;
          if (!v228)
            v230 = v214;
          v602 = v230;
          if (v228)
            v231 = v598;
          else
            v231 = v121;
          v232 = v597;
          if (!v228)
            v232 = v227;
          width = v232;
          height = v231;
          if (v228)
            v161 = 0.0;
          else
            v161 = y;
          if (v228)
            v162 = v214;
          else
            v162 = CGPointZero.x;
          v163 = v606;
          if (v228)
            v233 = y;
          else
            v233 = 0.0;
          if (v228)
            v234 = CGPointZero.x;
          else
            v234 = v213;
          v590 = v234;
          v591 = v233;
          if (v228)
            v235 = 0.0;
          else
            v235 = v139;
          v592 = v235;
          if (v228)
            v236 = v598;
          else
            v236 = v634;
          if (v228)
            v169 = v213;
          else
            v169 = CGPointZero.x;
          v588 = v236;
          v589 = 0.0;
          if (!v228)
            v139 = 0.0;
          v587 = 0.0;
          v152 = v161;
          v168 = v584;
        }
        else
        {
          MaxPoint = TSDRectGetMaxPoint(0.0, 0.0, v120, v121);
          v142 = v141;
          v143 = v141 - v139;
          v637 = TSDRectWithPoints(CGPointZero.x, y, MaxPoint, v143);
          v145 = v144;
          v147 = v146;
          v149 = v148;
          v150 = TSDRectWithPoints(0.0, v143, MaxPoint, v142);
          v152 = v151;
          v139 = v153;
          v639 = v154;
          v155 = -[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting");
          v156 = v125 + v622;
          v157 = v600;
          if (!v155)
            v157 = v145;
          v617 = v157;
          v158 = v599;
          if (!v155)
            v158 = v637;
          v602 = v158;
          if (v155)
            v159 = v598;
          else
            v159 = v149;
          height = v159;
          if (v155)
            v160 = v597;
          else
            v160 = v147;
          width = v160;
          if (v155)
            v161 = v145;
          else
            v161 = v125;
          if (v155)
            v162 = v637;
          else
            v162 = v126;
          v163 = v606;
          if (v155)
            v164 = v598;
          else
            v164 = v152;
          if (v155)
            v165 = 0.0;
          else
            v165 = v150;
          v590 = v165;
          v591 = v164;
          v587 = 0.0;
          if (v155)
            v166 = v597;
          else
            v166 = v139;
          v592 = v166;
          if (v155)
            v167 = 0.0;
          else
            v167 = v639;
          v588 = v167;
          v589 = 0.0;
          if (!v155)
            v152 = v156;
          v168 = v126;
          if (v155)
            v169 = v150;
          else
            v169 = v126;
          v170 = 0.0;
          if (v155)
            v170 = v639;
          else
            v139 = v606;
          v634 = v170;
          v32 = v685;
          v104 = v680;
        }
        objc_msgSend(v660, "setPosition:", v162, v161);
        v605 = 0.0;
        objc_msgSend(v660, "setBounds:");
        objc_msgSend(v135, "setPosition:", v169, v152);
        objc_msgSend(v135, "setBounds:", 0.0, 0.0, v139, v634);
        objc_msgSend(v131, "setPosition:", v168, v611);
        objc_msgSend(v131, "setBounds:", 0.0, 0.0, v163, v622);
        x = v602;
        y = v617;
        v601 = 0.0;
        goto LABEL_200;
      }
      v209 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      v210 = (void *)objc_claimAutoreleasedReturnValue(-[ICDocCamExtractedDocumentAnimationController imageWithColor:](v688, "imageWithColor:", v209));

      v132 = objc_retainAutorelease(v210);
      objc_msgSend(v131, "setContents:", objc_msgSend(v132, "CGImage"));
      objc_msgSend(v131, "setBounds:", 0.0, 0.0, v130, v129);
      objc_msgSend(v131, "setPosition:", v126, v125);
      v660 = 0;
      r1 = 0;
      v590 = CGPointZero.x;
      v591 = y;
      v592 = width;
      v587 = v605;
      v588 = height;
      v589 = CGRectNull.origin.x;
      goto LABEL_145;
    }
    v667 = v108;
    v668 = v106;
    if (v114)
    {
      if (v113 > 1.0)
      {
        v668 = v108 * v632;
        v667 = v108;
      }
      else
      {
        v668 = v106;
        v667 = v106 / v632;
      }
    }
    v746.origin.x = v677;
    v746.origin.y = v85;
    v746.size.width = v87;
    v746.size.height = v89;
    v755.origin.x = v102;
    v755.origin.y = v104;
    v755.size.width = v106;
    v755.size.height = v108;
    if (!CGRectIntersectsRect(v746, v755))
    {
      v660 = 0;
      r1 = 0;
      v678 = 0;
      v590 = CGPointZero.x;
      v591 = y;
      v587 = v605;
      v588 = height;
      v589 = CGRectNull.origin.x;
      v599 = CGPointZero.x;
      v600 = y;
      v597 = width;
      v598 = height;
      v595 = v605;
      v592 = width;
      v593 = CGRectNull.origin.x;
      v664 = v102;
      goto LABEL_201;
    }
    v747.origin.x = v677;
    v747.origin.y = v85;
    v747.size.width = v87;
    v747.size.height = v89;
    v756.origin.x = v102;
    v756.origin.y = v104;
    v756.size.width = v106;
    v756.size.height = v108;
    v748 = CGRectIntersection(v747, v756);
    v171 = v748.origin.x;
    v172 = v748.size.width;
    v173 = v748.size.height;
    v174 = -[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting");
    v612 = v171;
    v175 = v171 - v102;
    if (v174)
      v176 = y;
    else
      v176 = 0.0;
    v600 = v176;
    if (v174)
      v177 = CGPointZero.x;
    else
      v177 = v171 - v102;
    if (v174)
      v178 = 0.0;
    else
      v178 = y;
    if (v174)
      v179 = v175;
    else
      v179 = CGPointZero.x;
    if (v174)
      v180 = v671;
    else
      v180 = v173;
    v598 = v180;
    v599 = v177;
    if (v174)
      v181 = v672;
    else
      v181 = v172;
    v597 = v181;
    if (v174)
      v182 = v173;
    else
      v182 = v671;
    v665 = v172;
    if (!v174)
      v172 = v672;
    v183 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    objc_msgSend(v183, "setAnchorPoint:", 0.0, 0.0);
    objc_msgSend(v183, "setMasksToBounds:", 1);
    v678 = v183;
    if (!v114)
    {
      v211 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      v212 = (void *)objc_claimAutoreleasedReturnValue(-[ICDocCamExtractedDocumentAnimationController imageWithColor:](v688, "imageWithColor:", v211));

      v132 = objc_retainAutorelease(v212);
      objc_msgSend(v183, "setContents:", objc_msgSend(v132, "CGImage"));
      objc_msgSend(v183, "setBounds:", 0.0, 0.0, v172, v182);
      objc_msgSend(v183, "setPosition:", v179, v178);
      v660 = 0;
      r1 = 0;
      v590 = CGPointZero.x;
      v591 = y;
      v592 = width;
      v587 = v605;
      v588 = height;
      v589 = CGRectNull.origin.x;
      v664 = v102;
LABEL_145:
      v32 = v685;
LABEL_199:
      v104 = v680;
LABEL_200:

      v593 = 0.0;
      v595 = 0.0;
LABEL_201:
      v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "pageViewController"));
      v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v246, "view"));
      objc_msgSend(v247, "setAlpha:", 0.0);

      objc_msgSend(v670, "setAlpha:", 0.0);
      LODWORD(v246) = -[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting");
      v248 = objc_alloc((Class)UIImageView);
      if ((_DWORD)v246)
      {
        v249 = objc_msgSend(v248, "initWithFrame:", v664, v104, v668, v667);
        v250 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
        objc_msgSend(v250, "addSubview:", v249);

        objc_msgSend(v249, "setContentMode:", 1);
        objc_msgSend(v249, "setImage:", v674);
        objc_msgSend(v249, "setClipsToBounds:", 1);
        objc_msgSend(v249, "setFrame:", v664, v104, v668, v667);
        v251 = v673;
        if (v678)
        {
          v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v249, "layer"));
          objc_msgSend(v252, "setMask:", v678);

        }
        v253 = v679;
      }
      else
      {
        v249 = objc_msgSend(v248, "initWithFrame:", v657, v656, v672, v671);
        v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
        objc_msgSend(v254, "addSubview:", v249);

        objc_msgSend(v249, "setContentMode:", 1);
        objc_msgSend(v249, "setImage:", v674);
        objc_msgSend(v249, "setClipsToBounds:", 1);
        objc_msgSend(v249, "setFrame:", v657, v656, v672, v671);
        v251 = v673;
        if (v678)
        {
          v255 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v249, "layer"));
          objc_msgSend(v255, "setMask:", v678);

        }
        v253 = v684;
      }
      objc_msgSend(v253, "addObject:", v249);
      v619 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "toolbar"));
      v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "traitCollection"));
      v257 = objc_msgSend(v256, "horizontalSizeClass");
      v585 = v256;
      v258 = (char *)objc_msgSend(v256, "verticalSizeClass");
      if (v662 || v257 != (id)1 || (unint64_t)(v258 - 1) > 1)
      {
        v260 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "navigationBar"));
        v259 = v619;
      }
      else
      {
        v259 = v619;
        if (v30)
        {
          v260 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v646, "navigationBar"));
        }
        else
        {
          v445 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31, "viewControllerForColumn:", 0));
          v446 = objc_claimAutoreleasedReturnValue(objc_msgSend(v445, "navigationBar"));

          v260 = (void *)v446;
        }
      }
      v647 = v260;
      v261 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v260, "window"));
      v262 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v261, "windowScene"));
      v263 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v262, "statusBarManager"));

      v624 = v263;
      if ((objc_msgSend(v263, "isStatusBarHidden") & 1) == 0)
      {
        v264 = objc_alloc((Class)UIView);
        objc_msgSend(v263, "statusBarFrame");
        v265 = objc_msgSend(v264, "initWithFrame:");
        v266 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
        objc_msgSend(v265, "setBackgroundColor:", v266);

        objc_msgSend(v265, "setAccessibilityLabel:", CFSTR("noteEditorStatusBarBackground"));
        objc_msgSend(v265, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v265, "setHidden:", objc_msgSend(v263, "isStatusBarHidden"));
        v267 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
        objc_msgSend(v267, "addSubview:", v265);

        objc_msgSend(v679, "addObject:", v265);
      }
      if ((v662 & 1) != 0 || ((v649 | v627) & 1) == 0)
      {
        v297 = 0.0;
        v281 = 0.0;
        if ((objc_msgSend(v263, "isStatusBarHidden") & 1) == 0)
        {
          v303 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v647, "window"));
          v304 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v303, "windowScene"));
          sub_1000CA93C(v304);
          v281 = v305;

        }
        objc_msgSend(v647, "bounds");
        v283 = v306;
        v285 = v307;
        objc_msgSend(v259, "frame");
        v570 = v309;
        v573 = v308;
        v567 = v310;
        v302 = v311;
      }
      else
      {
        v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31, "view"));
        objc_msgSend(v647, "frame");
        v270 = v269;
        v272 = v271;
        v274 = v273;
        v276 = v275;
        v277 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "view"));
        objc_msgSend(v268, "convertRect:fromView:", v277, v270, v272, v274, v276);
        v279 = v278;
        v281 = v280;
        v283 = v282;
        v285 = v284;

        v286 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31, "view"));
        objc_msgSend(v259, "frame");
        v288 = v287;
        v290 = v289;
        v292 = v291;
        v294 = v293;
        v295 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "view"));
        v296 = v294;
        v297 = v279;
        objc_msgSend(v286, "convertRect:fromView:", v295, v288, v290, v292, v296);
        v570 = v299;
        v573 = v298;
        v567 = v300;
        v302 = v301;

      }
      objc_msgSend(v259, "bounds");
      v614 = v312;
      v580 = v314;
      v582 = v313;
      v316 = v315;
      v317 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v259, "_backgroundView"));

      v633 = v249;
      if (v317)
      {
        v318 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v259, "_backgroundView"));
        objc_msgSend(v318, "bounds");
        v320 = v319;

        if (v302 < v320)
          v302 = v320;
        v578 = v302;
        v321 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v259, "_backgroundView"));
        objc_msgSend(v321, "bounds");
        v323 = v322;

        if (v316 < v323)
          v316 = v323;
      }
      else
      {
        v578 = v302;
      }
      v576 = v316;
      v324 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v297, v281, v283, v285);
      objc_msgSend(v324, "setBackgroundColor:", 0);
      objc_msgSend(v324, "setAccessibilityLabel:", CFSTR("fakeNoteEditorNavBarBackground"));
      objc_msgSend(v324, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v325 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
      objc_msgSend(v325, "addSubview:", v324);

      objc_msgSend(v647, "bounds");
      left = UIEdgeInsetsZero.left;
      bottom = UIEdgeInsetsZero.bottom;
      right = UIEdgeInsetsZero.right;
      v329 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v647, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1));
      objc_msgSend(v329, "setFrame:", v297, v281, v283, v285);
      objc_msgSend(v329, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v329, "setAccessibilityLabel:", CFSTR("fakeNoteEditorNavBarView"));
      objc_msgSend(v329, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v330 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
      objc_msgSend(v330, "addSubview:", v329);

      v331 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v573, v570, v567, v578);
      objc_msgSend(v331, "setBackgroundColor:", 0);
      objc_msgSend(v331, "setAccessibilityLabel:", CFSTR("fakeNoteEditorToolbarBackground"));
      objc_msgSend(v331, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v331, "setHidden:", objc_msgSend(v259, "isHidden"));
      v332 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
      objc_msgSend(v332, "addSubview:", v331);

      v334 = v580;
      v333 = v582;
      v335 = v576;
      v581 = bottom;
      v583 = left;
      v577 = right;
      v336 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v259, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v614, v333, v334, v335, UIEdgeInsetsZero.top, left, bottom, right));
      objc_msgSend(v336, "setFrame:", v573, v570, v567, v578);
      objc_msgSend(v336, "setAccessibilityLabel:", CFSTR("fakeNoteEditorToolbarView"));
      objc_msgSend(v336, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v336, "setHidden:", objc_msgSend(v259, "isHidden"));
      v337 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
      objc_msgSend(v337, "addSubview:", v336);

      v615 = v324;
      objc_msgSend(v679, "addObject:", v324);
      if (v329)
        objc_msgSend(v679, "addObject:", v329);
      v116 = v680;
      if (v331)
        objc_msgSend(v679, "addObject:", v331);
      if (v336)
        objc_msgSend(v679, "addObject:", v336);
      if (!-[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting"))
      {
        objc_msgSend(v686, "addObject:", v324);
        if (v329)
          objc_msgSend(v686, "addObject:", v329);
        if (v331)
          objc_msgSend(v686, "addObject:", v331);
        if (v336)
          objc_msgSend(v686, "addObject:", v336);
      }
      if (((v662 ^ 1) & (v627 | v649)) != 1)
      {
        v344 = 0;
        v343 = 0;
        v345 = 0;
        v340 = 0;
        v631 = 0;
        v663 = 0;
        v117 = ICNoteEditorBaseViewController_ptr;
LABEL_278:

        v118 = v689;
        v32 = v685;
        v55 = v688;
        goto LABEL_279;
      }
      if (v630)
      {
        v338 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v658, "folderListViewController"));
        v339 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v338, "navigationController"));

        v340 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v339, "navigationBar"));
        v663 = v339;
        v579 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v339, "toolbar"));
        v341 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v658, "currentNoteBrowseViewController"));
        v342 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v341, "navigationController"));

        v343 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "navigationBar"));
        v631 = v342;
        v344 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v342, "toolbar"));
        if (!v649)
        {
LABEL_259:
          if (v627)
          {
LABEL_260:
            v628 = v344;
            v651 = v343;
            v399 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v659, "view"));
            objc_msgSend(v340, "frame");
            v401 = v400;
            v403 = v402;
            v405 = v404;
            v407 = v406;
            v408 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v340, "superview"));
            objc_msgSend(v399, "convertRect:fromView:", v408, v401, v403, v405, v407);
            v410 = v409;
            v412 = v411;
            v414 = v413;
            v416 = v415;

            v417 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v659, "view"));
            v345 = v579;
            objc_msgSend(v579, "frame");
            v419 = v418;
            v421 = v420;
            v423 = v422;
            v425 = v424;
            v426 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v579, "superview"));
            objc_msgSend(v417, "convertRect:fromView:", v426, v419, v421, v423, v425);
            v572 = v428;
            v575 = v427;
            v569 = v429;
            v431 = v430;

            objc_msgSend(v579, "bounds");
            v564 = v433;
            v566 = v432;
            v562 = v434;
            v436 = v435;
            v437 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v579, "_backgroundView"));

            if (v437)
            {
              v438 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v579, "_backgroundView"));
              objc_msgSend(v438, "bounds");
              v440 = v439;

              if (v436 < v440)
                v436 = v440;
              v558 = v436;
              v441 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v579, "_backgroundView"));
              objc_msgSend(v441, "bounds");
              v443 = v442;

              if (v431 < v443)
                v431 = v443;
              v560 = v431;
              v444 = ICNoteEditorBaseViewController_ptr;
            }
            else
            {
              v444 = ICNoteEditorBaseViewController_ptr;
              v558 = v436;
              v560 = v431;
            }
            v454 = objc_msgSend(objc_alloc((Class)v444[326]), "initWithFrame:", v410, v412, v414, v416);
            objc_msgSend(v454, "setBackgroundColor:", 0);
            objc_msgSend(v454, "setAccessibilityLabel:", CFSTR("fakeFolderListNavBarBackground"));
            objc_msgSend(v454, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            objc_msgSend(v454, "setHidden:", objc_msgSend(v340, "isHidden"));
            v455 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
            objc_msgSend(v455, "addSubview:", v454);

            objc_msgSend(v340, "bounds");
            v456 = v340;
            v457 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v340, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1));
            objc_msgSend(v457, "setFrame:", v410, v412, v414, v416);
            objc_msgSend(v457, "setAccessibilityLabel:", CFSTR("fakeFolderListNavBarView"));
            objc_msgSend(v457, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            objc_msgSend(v457, "setHidden:", objc_msgSend(v456, "isHidden"));
            v458 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
            objc_msgSend(v458, "addSubview:", v457);

            v459 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v579, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v566, v564, v562, v558, UIEdgeInsetsZero.top, v583, v581, v577));
            objc_msgSend(v459, "setFrame:", v575, v572, v569, v560);
            objc_msgSend(v459, "setAccessibilityLabel:", CFSTR("fakeFolderListToolbarView"));
            objc_msgSend(v459, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            objc_msgSend(v459, "setHidden:", objc_msgSend(v579, "isHidden"));
            v460 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
            objc_msgSend(v460, "addSubview:", v459);

            objc_msgSend(v679, "addObject:", v454);
            objc_msgSend(v679, "addObject:", v457);
            objc_msgSend(v679, "addObject:", v459);
            if (-[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting"))
              v461 = v655;
            else
              v461 = v686;
            objc_msgSend(v461, "addObject:", v454);
            objc_msgSend(v461, "addObject:", v457);
            objc_msgSend(v461, "addObject:", v459);

            v115 = v679;
            v340 = v456;
            v117 = ICNoteEditorBaseViewController_ptr;
            v116 = v680;
            v343 = v651;
            v344 = v628;
            goto LABEL_278;
          }
          goto LABEL_272;
        }
      }
      else
      {
        if (v627)
        {
          v346 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v658, "folderListViewController"));
          v347 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v346, "navigationController"));

          v340 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v347, "navigationBar"));
          v663 = v347;
          v348 = objc_claimAutoreleasedReturnValue(objc_msgSend(v347, "toolbar"));
        }
        else
        {
          v348 = 0;
          v340 = 0;
          v663 = 0;
        }
        v579 = (void *)v348;
        if (!v649)
        {
          v631 = 0;
          v343 = 0;
          v344 = 0;
          goto LABEL_259;
        }
        v349 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v658, "currentNoteBrowseViewController"));
        v350 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v349, "navigationController"));

        v343 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v350, "navigationBar"));
        v631 = v350;
        v344 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v350, "toolbar"));
      }
      v650 = v340;
      v351 = v344;
      v352 = v343;
      v353 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v659, "view"));
      objc_msgSend(v352, "frame");
      v355 = v354;
      v357 = v356;
      v359 = v358;
      v361 = v360;
      v362 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v352, "superview"));
      objc_msgSend(v353, "convertRect:fromView:", v362, v355, v357, v359, v361);
      v364 = v363;
      v366 = v365;
      v368 = v367;
      v370 = v369;

      v371 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v659, "view"));
      objc_msgSend(v351, "frame");
      v373 = v372;
      v375 = v374;
      v377 = v376;
      v379 = v378;
      v380 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v351, "superview"));
      objc_msgSend(v371, "convertRect:fromView:", v380, v373, v375, v377, v379);
      v571 = v382;
      v574 = v381;
      v568 = v383;
      v385 = v384;

      objc_msgSend(v351, "bounds");
      v563 = v387;
      v565 = v386;
      v561 = v388;
      v390 = v389;
      v391 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v351, "_backgroundView"));

      if (v391)
      {
        v392 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v351, "_backgroundView"));
        objc_msgSend(v392, "bounds");
        v394 = v393;

        if (v390 < v394)
          v390 = v394;
        v557 = v390;
        v395 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v351, "_backgroundView"));
        objc_msgSend(v395, "bounds");
        v397 = v396;

        if (v385 < v397)
          v385 = v397;
        v559 = v385;
        v398 = ICNoteEditorBaseViewController_ptr;
      }
      else
      {
        v398 = ICNoteEditorBaseViewController_ptr;
        v557 = v390;
        v559 = v385;
      }
      v447 = objc_msgSend(objc_alloc((Class)v398[326]), "initWithFrame:", v364, v366, v368, v370);
      objc_msgSend(v447, "setBackgroundColor:", 0);
      objc_msgSend(v447, "setAccessibilityLabel:", CFSTR("fakeNoteListNavBarBackground"));
      objc_msgSend(v447, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v447, "setHidden:", objc_msgSend(v352, "isHidden"));
      v448 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
      objc_msgSend(v448, "addSubview:", v447);

      objc_msgSend(v352, "bounds");
      v449 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v352, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1));
      objc_msgSend(v449, "setFrame:", v364, v366, v368, v370);
      objc_msgSend(v449, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v449, "setAccessibilityLabel:", CFSTR("fakeNoteListNavBarView"));
      objc_msgSend(v449, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v449, "setHidden:", objc_msgSend(v352, "isHidden"));
      v450 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
      objc_msgSend(v450, "addSubview:", v449);

      v451 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v351, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v565, v563, v561, v557, UIEdgeInsetsZero.top, v583, v581, v577));
      objc_msgSend(v451, "setFrame:", v574, v571, v568, v559);
      objc_msgSend(v451, "setAccessibilityLabel:", CFSTR("fakeNoteListToolbarView"));
      objc_msgSend(v451, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v451, "setHidden:", objc_msgSend(v351, "isHidden"));
      v452 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
      objc_msgSend(v452, "addSubview:", v451);

      objc_msgSend(v679, "addObject:", v447);
      objc_msgSend(v679, "addObject:", v449);
      objc_msgSend(v679, "addObject:", v451);
      if (-[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting"))
        v453 = v655;
      else
        v453 = v686;
      objc_msgSend(v453, "addObject:", v447);
      objc_msgSend(v453, "addObject:", v449);

      v115 = v679;
      v343 = v352;

      v116 = v680;
      v340 = v650;
      v344 = v351;
      if (v627)
        goto LABEL_260;
LABEL_272:
      v117 = ICNoteEditorBaseViewController_ptr;
      v345 = v579;
      goto LABEL_278;
    }
    v618 = v172;
    v623 = v178;
    v132 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("gallery_fade_gradient")));
    v184 = v632;
    if (v632 > 1.0)
    {
      v185 = objc_claimAutoreleasedReturnValue(+[UIImage ic_orientedImageFromImage:toOrientation:](UIImage, "ic_orientedImageFromImage:toOrientation:", v132, 2, v632));

      v132 = (id)v185;
    }
    v186 = v182;
    v187 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer", v184));
    objc_msgSend(v187, "setAnchorPoint:", 0.0, 0.0);
    objc_msgSend(v187, "setContents:", objc_msgSend(v132, "ic_CGImage"));
    v188 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    objc_msgSend(v188, "setAnchorPoint:", 0.0, 0.0);
    v189 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    objc_msgSend(v188, "setBackgroundColor:", objc_msgSend(v189, "CGColor"));

    v660 = v188;
    objc_msgSend(v183, "addSublayer:", v188);
    r1 = v187;
    objc_msgSend(v183, "addSublayer:", v187);
    v190 = v173 * 0.1;
    if (v632 > 1.0)
      v190 = v654 * 0.055;
    v191 = round(v190);
    if (v632 > 1.0)
    {
      if (v612 == v653 && v665 < v654)
      {
        v201 = v654 - v191;
        v749.origin.y = 0.0;
        v749.origin.x = v654 - v191;
        v592 = v191;
        v749.size.width = v191;
        v749.size.height = v645;
        MinX = CGRectGetMinX(v749);
        v604 = v645;
        v594 = 0.0;
      }
      else
      {
        v750.origin.x = 0.0;
        v750.origin.y = 0.0;
        v750.size.width = v665;
        v237 = v191;
        v750.size.height = v173;
        v238 = CGRectGetMaxX(v750) - v237;
        v239 = TSDRectGetMaxPoint(0.0, 0.0, v665, v173);
        v751.origin.x = TSDRectWithPoints(v238, 0.0, v239, v240);
        v201 = v751.origin.x;
        v592 = v751.size.width;
        v594 = v751.origin.y;
        v604 = v751.size.height;
        MinX = CGRectGetMinX(v751);
      }
      v32 = v685;
      v752.origin.x = 0.0;
      v752.origin.y = 0.0;
      v752.size.width = v665;
      v752.size.height = v173;
      MaxY = CGRectGetMaxY(v752);
      v666 = TSDRectWithPoints(CGPointZero.x, y, MinX, MaxY);
      v635 = v242;
      v199 = v243;
      v220 = v244;
      if (-[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting"))
      {
        v591 = 0.0;
        v613 = v592;
        v207 = v604;
        x = v599;
        y = v600;
        v588 = v598;
        v589 = 0.0;
        width = v597;
        height = v598;
        v590 = v597;
        v587 = 0.0;
        v592 = 0.0;
        v208 = v179;
        v203 = v594;
        goto LABEL_195;
      }
      v207 = v604;
      v219 = v179;
      v221 = v179 + v618;
      v218 = v623;
      v222 = v623;
      v203 = v594;
      v224 = v186;
      v223 = 0.0;
    }
    else
    {
      v192 = v191;
      v193 = TSDRectGetMaxPoint(0.0, 0.0, v665, v173);
      v195 = v194;
      v196 = v194 - v192;
      v666 = TSDRectWithPoints(CGPointZero.x, y, v193, v194 - v192);
      v635 = v197;
      v199 = v198;
      v603 = v200;
      v201 = TSDRectWithPoints(0.0, v196, v193, v195);
      v203 = v202;
      v205 = v204;
      v207 = v206;
      if (-[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting"))
      {
        v613 = v205;
        v590 = 0.0;
        x = v599;
        y = v600;
        v589 = 0.0;
        width = v597;
        height = v598;
        v591 = v598;
        v592 = v597;
        v587 = 0.0;
        v588 = 0.0;
        v32 = v685;
        v208 = v179;
LABEL_195:
        v245 = v666;
        v222 = v635;
LABEL_198:
        objc_msgSend(v660, "setPosition:", v245, v222);
        v605 = 0.0;
        objc_msgSend(v660, "setBounds:");
        objc_msgSend(v187, "setPosition:", v201, v203);
        objc_msgSend(v187, "setBounds:", 0.0, 0.0, v613, v207);
        objc_msgSend(v183, "setPosition:", v208, v623);
        objc_msgSend(v183, "setBounds:", 0.0, 0.0, v618, v186);
        v601 = 0.0;
        v664 = v653;
        goto LABEL_199;
      }
      v592 = v205;
      v218 = v623 + v186;
      v220 = v603;
      v219 = v179;
      v221 = v179;
      v222 = v623;
      v223 = v618;
      v224 = 0.0;
      v32 = v685;
    }
    v613 = v223;
    x = v666;
    y = v635;
    v589 = 0.0;
    v590 = v201;
    width = v199;
    height = v220;
    v245 = v219;
    v591 = v203;
    v587 = 0.0;
    v588 = v207;
    v203 = v218;
    v201 = v221;
    v207 = v224;
    v208 = v219;
    goto LABEL_198;
  }
  v596 = 0;
  v660 = 0;
  r1 = 0;
  v678 = 0;
  v670 = 0;
  v631 = 0;
  v633 = 0;
  v663 = 0;
  v116 = CGRectZero.origin.y;
  v590 = CGPointZero.x;
  v591 = CGPointZero.y;
  v587 = CGRectNull.origin.y;
  v588 = CGRectNull.size.height;
  v592 = CGRectNull.size.width;
  v593 = CGRectNull.origin.x;
  v589 = CGRectNull.origin.x;
  v599 = CGPointZero.x;
  v600 = v591;
  v597 = v592;
  v598 = v588;
  v595 = v587;
  v664 = CGRectZero.origin.x;
  v667 = CGRectZero.size.height;
  v645 = v667;
  v668 = CGRectZero.size.width;
  v653 = CGRectZero.origin.x;
  v654 = v668;
  v115 = v679;
  v117 = ICNoteEditorBaseViewController_ptr;
  v118 = v689;
LABEL_279:
  v681 = v116;
  if ((objc_msgSend(v682, "isStatusBarHidden") & 1) == 0)
  {
    v462 = objc_alloc((Class)v117[326]);
    objc_msgSend(v682, "statusBarFrame");
    v463 = objc_msgSend(v462, "initWithFrame:");
    v464 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    objc_msgSend(v463, "setBackgroundColor:", v464);

    objc_msgSend(v463, "setAccessibilityLabel:", CFSTR("extractedDocumentStatusBarBackground"));
    objc_msgSend(v463, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v118 = v689;
    objc_msgSend(v463, "setHidden:", objc_msgSend(v682, "isStatusBarHidden"));
    v465 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
    objc_msgSend(v465, "addSubview:", v463);

    if (-[ICDocCamExtractedDocumentAnimationController isPresenting](v55, "isPresenting"))
      v466 = v686;
    else
      v466 = v655;
    objc_msgSend(v466, "addObject:", v463);
    objc_msgSend(v115, "addObject:", v463);

  }
  v467 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v676, "navigationBar"));
  v468 = objc_alloc((Class)v117[326]);
  objc_msgSend(v467, "frame");
  v469 = objc_msgSend(v468, "initWithFrame:");
  objc_msgSend(v469, "setBackgroundColor:", 0);
  objc_msgSend(v469, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v469, "setAccessibilityLabel:", CFSTR("extractedDocumentNavBarBackground"));
  objc_msgSend(v469, "setHidden:", objc_msgSend(v467, "isHidden"));
  v470 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "containerView"));
  objc_msgSend(v470, "addSubview:", v469);

  objc_msgSend(v467, "bounds");
  top = UIEdgeInsetsZero.top;
  v472 = UIEdgeInsetsZero.left;
  v616 = UIEdgeInsetsZero.right;
  v620 = UIEdgeInsetsZero.bottom;
  v473 = v115;
  v474 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v467, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1));
  objc_msgSend(v467, "frame");
  objc_msgSend(v474, "setFrame:");
  objc_msgSend(v474, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v474, "setAccessibilityLabel:", CFSTR("extractedDocumentNavBarView"));
  v652 = v467;
  objc_msgSend(v474, "setHidden:", objc_msgSend(v467, "isHidden"));
  v475 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "containerView"));
  objc_msgSend(v475, "addSubview:", v474);

  if (-[ICDocCamExtractedDocumentAnimationController isPresenting](v55, "isPresenting"))
    v476 = v686;
  else
    v476 = v655;
  objc_msgSend(v476, "addObject:", v469);
  objc_msgSend(v476, "addObject:", v474);
  v648 = v469;
  objc_msgSend(v473, "addObject:", v469);
  v629 = v474;
  objc_msgSend(v473, "addObject:", v474);
  v477 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomToolbar"));
  objc_msgSend(v477, "bounds");
  v479 = v478;
  v481 = v480;
  v483 = v482;
  v485 = v484;
  objc_msgSend(v477, "frame");
  v487 = v486;
  v625 = v488;
  v610 = v489;
  v491 = v490;
  v492 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomToolbar"));
  v493 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v492, "_backgroundView"));

  if (v493)
  {
    v494 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomToolbar"));
    v495 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v494, "_backgroundView"));
    objc_msgSend(v495, "bounds");
    v497 = v496;

    if (v485 < v497)
      v485 = v497;
    v498 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomToolbar"));
    v499 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v498, "_backgroundView"));
    objc_msgSend(v499, "bounds");
    v501 = v500;

    if (v491 < v501)
      v491 = v501;
    top = UIEdgeInsetsZero.top;
  }
  v502 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v477, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v479, v481, v483, v485, top, v472, v620, v616));
  objc_msgSend(v502, "setFrame:", v487, v625, v610, v491);
  objc_msgSend(v502, "setAccessibilityLabel:", CFSTR("fakeExtractedDocumentBottomToolbar"));
  objc_msgSend(v502, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v502, "setHidden:", objc_msgSend(v477, "isHidden"));
  v503 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "containerView"));
  objc_msgSend(v503, "addSubview:", v502);

  v504 = -[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting");
  v505 = v504 == 0;
  if (v504)
    v506 = v686;
  else
    v506 = v655;
  if (v505)
    v507 = v473;
  else
    v507 = v684;
  objc_msgSend(v506, "addObject:", v502);
  v626 = v502;
  objc_msgSend(v507, "addObject:", v502);
  objc_msgSend(v477, "setAlpha:", 0.0);
  v508 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topToolbar"));
  if ((objc_msgSend(v508, "isHidden") & 1) == 0
    && objc_msgSend(v32, "thumbnailContainerViewIsVisible"))
  {
    objc_msgSend(v508, "bounds");
    v509 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v508, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1));
    objc_msgSend(v509, "setAccessibilityLabel:", CFSTR("fakeExtractedDocumentTopToolbar"));
    objc_msgSend(v509, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v508, "frame");
    objc_msgSend(v509, "setFrame:");
    objc_msgSend(v509, "setHidden:", objc_msgSend(v508, "isHidden"));
    v510 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "containerView"));
    objc_msgSend(v510, "addSubview:", v509);

    v511 = -[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting");
    v512 = v511 == 0;
    if (v511)
      v513 = v686;
    else
      v513 = v655;
    if (v512)
      v514 = v473;
    else
      v514 = v684;
    objc_msgSend(v513, "addObject:", v509);
    objc_msgSend(v514, "addObject:", v509);
    objc_msgSend(v508, "setAlpha:", 0.0);

  }
  v515 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "filterViewController"));
  v516 = v515;
  if (v515)
  {
    v517 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v515, "scrollView"));
    objc_msgSend(v517, "bounds");
    v518 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v517, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1));
    objc_msgSend(v518, "setAccessibilityLabel:", CFSTR("fakeFilterScrollView"));
    objc_msgSend(v518, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v517, "frame");
    objc_msgSend(v518, "setFrame:");
    objc_msgSend(v518, "setHidden:", objc_msgSend(v517, "isHidden"));
    v519 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v689, "containerView"));
    objc_msgSend(v519, "addSubview:", v518);

    v520 = -[ICDocCamExtractedDocumentAnimationController isPresenting](v688, "isPresenting");
    v521 = v520 == 0;
    if (v520)
      v522 = v686;
    else
      v522 = v655;
    if (v521)
      v523 = v473;
    else
      v523 = v684;
    objc_msgSend(v522, "addObject:", v518);
    objc_msgSend(v523, "addObject:", v518);
    objc_msgSend(v517, "setAlpha:", 0.0);

  }
  v621 = v516;
  v739 = 0u;
  v740 = 0u;
  v737 = 0u;
  v738 = 0u;
  v524 = v686;
  v525 = objc_msgSend(v524, "countByEnumeratingWithState:objects:count:", &v737, v742, 16);
  if (v525)
  {
    v526 = v525;
    v527 = *(_QWORD *)v738;
    do
    {
      for (i = 0; i != v526; i = (char *)i + 1)
      {
        if (*(_QWORD *)v738 != v527)
          objc_enumerationMutation(v524);
        v529 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v737 + 1) + 8 * (_QWORD)i), "layer"));
        LODWORD(v530) = 0;
        objc_msgSend(v529, "setOpacity:", v530);

      }
      v526 = objc_msgSend(v524, "countByEnumeratingWithState:objects:count:", &v737, v742, 16);
    }
    while (v526);
  }

  v735 = 0u;
  v736 = 0u;
  v733 = 0u;
  v734 = 0u;
  v531 = v655;
  v532 = objc_msgSend(v531, "countByEnumeratingWithState:objects:count:", &v733, v741, 16);
  if (v532)
  {
    v533 = v532;
    v534 = *(_QWORD *)v734;
    do
    {
      for (j = 0; j != v533; j = (char *)j + 1)
      {
        if (*(_QWORD *)v734 != v534)
          objc_enumerationMutation(v531);
        v536 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v733 + 1) + 8 * (_QWORD)j), "layer"));
        LODWORD(v537) = 1.0;
        objc_msgSend(v536, "setOpacity:", v537);

      }
      v533 = objc_msgSend(v531, "countByEnumeratingWithState:objects:count:", &v733, v741, 16);
    }
    while (v533);
  }
  v687 = v508;

  v538 = v689;
  if (v683)
  {
    -[ICDocCamExtractedDocumentAnimationController transitionDuration:](v688, "transitionDuration:", v689);
    v540 = v539;
    +[CATransaction begin](CATransaction, "begin");
    *(float *)&v541 = v540;
    v542 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v541));
    +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", v542, kCATransactionAnimationDuration);

    v543 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", v543, kCATransactionAnimationTimingFunction);

    objc_msgSend(v678, "setBounds:", v593, v595, v597, v598);
    objc_msgSend(v678, "setPosition:", v599, v600);
    if (v596)
    {
      objc_msgSend(v660, "setPosition:", x, y);
      objc_msgSend(v660, "setBounds:", v601, v605, width, height);
      objc_msgSend(r1, "setPosition:", v590, v591);
      objc_msgSend(r1, "setBounds:", v589, v587, v592, v588);
    }
    +[CATransaction commit](CATransaction, "commit");
    v538 = v689;
  }
  -[ICDocCamExtractedDocumentAnimationController transitionDuration:](v688, "transitionDuration:", v538);
  v545 = v544;
  v715[0] = _NSConcreteStackBlock;
  v715[1] = 3221225472;
  v715[2] = sub_1000CDA98;
  v715[3] = &unk_100554248;
  v716 = v524;
  v717 = v531;
  v718 = v688;
  v732 = v683;
  v546 = v633;
  v547 = v538;
  v548 = v546;
  v721 = v657;
  v722 = v656;
  v723 = v672;
  v724 = v671;
  v719 = v546;
  v720 = 0;
  v725 = 0;
  v726 = v664;
  v727 = v681;
  v728 = v668;
  v729 = v667;
  size = CGRectZero.size;
  origin = CGRectZero.origin;
  v731 = size;
  v690[0] = _NSConcreteStackBlock;
  v690[1] = 3221225472;
  v690[2] = sub_1000CDCC8;
  v690[3] = &unk_100554270;
  v691 = v547;
  v549 = v716;
  v692 = v549;
  v550 = v717;
  v693 = v550;
  v551 = v679;
  v694 = v551;
  v54 = v685;
  v695 = v54;
  v696 = v688;
  v714 = v683;
  v552 = v548;
  v703 = v657;
  v704 = v656;
  v705 = v672;
  v706 = v671;
  v697 = v552;
  v698 = 0;
  v707 = 0;
  v708 = v653;
  v709 = v681;
  v710 = v654;
  v711 = v645;
  v712 = origin;
  v713 = size;
  v553 = v670;
  v699 = v553;
  v554 = v687;
  v700 = v554;
  v555 = v477;
  v701 = v555;
  v556 = v684;
  v702 = v556;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v715, v690, v545);

  v53 = v689;
  v8 = v643;
  v7 = v644;
  v11 = v646;
  v14 = v642;
  v17 = v676;
LABEL_335:

}

- (void)animateDismissalTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "setAlpha:", 1.0);

  -[ICDocCamExtractedDocumentAnimationController transitionDuration:](self, "transitionDuration:", v4);
  v8 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000CE388;
  v14[3] = &unk_100550110;
  v15 = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000CE3BC;
  v11[3] = &unk_100552678;
  v12 = v4;
  v13 = v15;
  v9 = v15;
  v10 = v4;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v11, v8);

}

- (id)imageWithColor:(id)a3
{
  id v3;
  CGContext *CurrentContext;
  id v5;
  CGColor *v6;
  UIImage *ImageFromCurrentImageContext;
  void *v8;
  CGSize v10;
  CGRect v11;

  v3 = a3;
  v10.width = 1.0;
  v10.height = 1.0;
  UIGraphicsBeginImageContext(v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = objc_retainAutorelease(v3);
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  CGContextFillRect(CurrentContext, v11);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v8;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (UIView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailView, 0);
}

@end
