@implementation VUIPlaybackManager

- (BOOL)isFullscreenPlaybackUIBeingShown
{
  void *v2;
  void *v3;
  BOOL v4;

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[VUIPlaybackManager _isFullScreenPlaybackState:](VUIPlaybackManager, "_isFullScreenPlaybackState:", v3);

  return v4;
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

+ (BOOL)_isFullScreenPlaybackState:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Showing video full screen")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Showing video full screen with post play content on screen")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Waiting for AVPlayerViewController presentation to complete")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Showing extras video full screen outside extras content")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Showing multiview playback fullscreen")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Showing multiview playback fullscreen due to small screen size"));
  }

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1)
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_364);
  return (id)sharedInstance_instance;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v3;

  -[VUIPlaybackManager stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Application did become active"));

}

void __36__VUIPlaybackManager_sharedInstance__block_invoke()
{
  os_log_t v0;
  void *v1;
  VUIPlaybackManager *v2;
  void *v3;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIPlaybackManager");
  v1 = (void *)sLogObject_5;
  sLogObject_5 = (uint64_t)v0;

  v2 = objc_alloc_init(VUIPlaybackManager);
  v3 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v2;

}

- (VUIPlaybackManager)init
{
  VUIPlaybackManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *audioSessionSerialQueue;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  VUIPlaybackManager *v11;
  uint64_t v12;
  TVPStateMachine *stateMachine;
  uint64_t v14;
  NSMutableArray *multiviewPlaybackInfo;
  void *v16;
  void *v17;
  uint64_t v18;
  VUIPerformanceDebuggerViewController *performanceDebuggerViewController;
  void *v20;
  void *v21;
  uint64_t v22;
  VUITimedMetadataDebuggerViewController *timedMetadataDebuggerViewController;
  _QWORD v25[4];
  VUIPlaybackManager *v26;
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)VUIPlaybackManager;
  v2 = -[VUIPlaybackManager init](&v29, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("Playback manager audio session serial queue", 0);
    audioSessionSerialQueue = v2->_audioSessionSerialQueue;
    v2->_audioSessionSerialQueue = (OS_dispatch_queue *)v3;

    v5 = +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
    -[VUIPlaybackManager _registerApplicationNotifications](v2, "_registerApplicationNotifications");
    -[VUIPlaybackManager _registerAudioSessionNotifications](v2, "_registerAudioSessionNotifications");
    v6 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v7 = objc_opt_class();
    v8 = init_instanceNumber++;
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@ %ld"), v7, v8);
    v2->_trackingPlayerViewFrame = 0;
    objc_initWeak(&location, v2);
    v10 = objc_alloc(MEMORY[0x1E0DB1978]);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __26__VUIPlaybackManager_init__block_invoke;
    v25[3] = &unk_1E9F9CEB8;
    objc_copyWeak(&v27, &location);
    v11 = v2;
    v26 = v11;
    v12 = objc_msgSend(v10, "initWithName:initialState:mode:stateChangeHandler:", v9, CFSTR("Not showing anything"), 0, v25);
    stateMachine = v11->_stateMachine;
    v11->_stateMachine = (TVPStateMachine *)v12;

    -[TVPStateMachine setLogObject:](v11->_stateMachine, "setLogObject:", sLogObject_5);
    -[TVPStateMachine setCallsStateChangeHandlerSynchronously:](v11->_stateMachine, "setCallsStateChangeHandlerSynchronously:", 1);
    -[VUIPlaybackManager _registerStateMachineHandlers](v11, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v11->_stateMachine, "setShouldAcceptEvents:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    multiviewPlaybackInfo = v11->_multiviewPlaybackInfo;
    v11->_multiviewPlaybackInfo = (NSMutableArray *)v14;

    if (-[VUIPlaybackManager _shouldShowPerformanceDebugger](v11, "_shouldShowPerformanceDebugger"))
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "documentCreator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "performanceDebuggerViewController");
      v18 = objc_claimAutoreleasedReturnValue();
      performanceDebuggerViewController = v11->_performanceDebuggerViewController;
      v11->_performanceDebuggerViewController = (VUIPerformanceDebuggerViewController *)v18;

    }
    if (-[VUIPlaybackManager _shouldShowTimedMetadataDebugger](v11, "_shouldShowTimedMetadataDebugger"))
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "documentCreator");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timedMetadataDebuggerViewController");
      v22 = objc_claimAutoreleasedReturnValue();
      timedMetadataDebuggerViewController = v11->_timedMetadataDebuggerViewController;
      v11->_timedMetadataDebuggerViewController = (VUITimedMetadataDebuggerViewController *)v22;

    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)_registerStateMachineHandlers
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  void *v94;
  id *v95;
  id v96;
  void *v97;
  id v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  id *v112;
  id v113;
  void *v114;
  id *v115;
  id v116;
  void *v117;
  void *v118;
  id *v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  void *v125;
  id v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  id v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  void *v146;
  void *v147;
  id v148;
  void *v149;
  id *v150;
  id v151;
  void *v152;
  id v153;
  id *v154;
  id v155;
  void *v156;
  id *v157;
  id v158;
  void *v159;
  id v160;
  void *v161;
  id v162;
  id *v163;
  id *v164;
  id v165;
  void *v166;
  id v167;
  void *v168;
  id v169;
  void *v170;
  id v171;
  void *v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  id v177;
  void *v178;
  id v179;
  void *v180;
  id v181;
  void *v182;
  void *v183;
  id v184;
  void *v185;
  id v186;
  void *v187;
  id *v188;
  id v189;
  void *v190;
  id v191;
  void *v192;
  id v193;
  void *v194;
  id *v195;
  id v196;
  void *v197;
  id *v198;
  id v199;
  void *v200;
  id *v201;
  id v202;
  void *v203;
  id *v204;
  id v205;
  void *v206;
  id v207;
  void *v208;
  void *v209;
  id v210;
  void *v211;
  void *v212;
  id *v213;
  id v214;
  void *v215;
  void *v216;
  id v217;
  id v218;
  void *v219;
  id v220;
  void *v221;
  id v222;
  void *v223;
  id v224;
  void *v225;
  void *v226;
  id v227;
  void *v228;
  id v229;
  void *v230;
  void *v231;
  id *v232;
  id v233;
  void *v234;
  void *v235;
  id v236;
  void *v237;
  id v238;
  void *v239;
  id v240;
  void *v241;
  id v242;
  void *v243;
  id v244;
  void *v245;
  void *v246;
  id v247;
  void *v248;
  id *v249;
  id v250;
  void *v251;
  id v252;
  void *v253;
  id *v254;
  id v255;
  void *v256;
  void *v257;
  void *v258;
  id v259;
  id v260;
  void *v261;
  id v262;
  id v263;
  void *v264;
  void *v265;
  id v266;
  id v267;
  void *v268;
  id v269;
  void *v270;
  id v271;
  void *v272;
  void *v273;
  id v274;
  id *v275;
  id *v276;
  id *v277;
  id *v278;
  id *v279;
  id *v280;
  id *v281;
  id *v282;
  id *v283;
  id *v284;
  id *v285;
  id *v286;
  id *v287;
  id *v288;
  id *v289;
  id *v290;
  id v291;
  id v292;
  id *v293;
  id v294;
  id v295;
  id v296;
  id *v297;
  id *location;
  id *v299;
  id *v300;
  id *v301;
  id *v302;
  id *v303;
  id *v304;
  id *v305;
  id *v306;
  id *v307;
  id *v308;
  id *v309;
  id *v310;
  id *v311;
  id *v312;
  id *v313;
  id *v314;
  id *v315;
  id *v316;
  id *v317;
  _QWORD v318[4];
  id v319;
  id v320;
  _QWORD v321[4];
  id v322;
  _QWORD v323[4];
  id v324;
  _QWORD v325[4];
  id v326;
  id v327;
  _QWORD v328[4];
  id *v329;
  id v330;
  id v331;
  _QWORD v332[4];
  id *v333;
  id v334;
  _QWORD v335[4];
  id *v336;
  id v337;
  _QWORD v338[4];
  id *v339;
  id v340;
  _QWORD v341[4];
  id *v342;
  id v343;
  _QWORD v344[4];
  id v345;
  _QWORD v346[4];
  id *v347;
  id v348;
  _QWORD v349[4];
  id v350;
  _QWORD v351[4];
  id v352;
  _QWORD v353[4];
  id *v354;
  id v355;
  _QWORD v356[4];
  id *v357;
  id v358;
  _QWORD v359[4];
  id v360;
  _QWORD v361[4];
  id *v362;
  id v363;
  _QWORD v364[4];
  id v365;
  _QWORD v366[4];
  id v367;
  _QWORD v368[4];
  id *v369;
  id v370;
  id v371;
  id v372;
  _QWORD v373[4];
  id *v374;
  id v375;
  _QWORD v376[4];
  id v377;
  _QWORD v378[4];
  id *v379;
  id v380;
  _QWORD v381[4];
  id *v382;
  id *v383;
  id v384;
  _QWORD v385[4];
  id *v386;
  id *v387;
  id v388;
  _QWORD v389[4];
  id *v390;
  _QWORD v391[4];
  id *v392;
  id v393;
  _QWORD v394[4];
  id v395;
  _QWORD v396[4];
  id *v397;
  _QWORD v398[4];
  id *v399;
  id v400;
  _QWORD v401[4];
  id v402;
  _QWORD v403[4];
  id v404;
  _QWORD v405[4];
  id *v406;
  id v407;
  _QWORD v408[4];
  id v409;
  _QWORD v410[4];
  id v411;
  id *v412;
  id v413;
  _QWORD v414[4];
  id v415;
  _QWORD v416[4];
  id v417;
  id *v418;
  id *v419;
  id *v420;
  id v421;
  _QWORD v422[4];
  id *v423;
  _QWORD v424[4];
  id v425;
  id *v426;
  id v427;
  _QWORD v428[4];
  id *v429;
  id v430;
  _QWORD v431[4];
  id v432;
  _QWORD v433[4];
  id v434;
  id v435;
  _QWORD v436[4];
  id v437;
  _QWORD v438[4];
  id v439;
  _QWORD v440[4];
  id v441;
  _QWORD v442[4];
  id v443;
  id v444;
  _QWORD v445[4];
  id *v446;
  id v447;
  _QWORD v448[4];
  id *v449;
  _QWORD v450[4];
  id *v451;
  id v452;
  _QWORD v453[4];
  id *v454;
  _QWORD v455[4];
  id *v456;
  id v457;
  _QWORD v458[4];
  id v459;
  _QWORD v460[4];
  id v461;
  _QWORD v462[4];
  id v463;
  _QWORD v464[4];
  id v465;
  _QWORD v466[4];
  id v467;
  id v468;
  _QWORD v469[4];
  id *v470;
  id v471;
  _QWORD v472[4];
  id v473;
  id v474;
  _QWORD v475[4];
  id *v476;
  _QWORD v477[4];
  id v478;
  _QWORD v479[4];
  id v480;
  _QWORD v481[4];
  id v482;
  _QWORD v483[4];
  id v484;
  _QWORD v485[4];
  id *v486;
  id v487;
  _QWORD v488[4];
  id *v489;
  id v490;
  _QWORD v491[4];
  id *v492;
  id v493;
  _QWORD v494[4];
  id v495;
  id v496;
  _QWORD v497[4];
  id v498;
  id v499;
  _QWORD v500[4];
  id v501;
  _QWORD v502[4];
  id v503;
  _QWORD v504[4];
  id v505;
  id v506;
  _QWORD v507[4];
  id v508;
  id v509;
  _QWORD v510[4];
  id v511;
  id v512;
  _QWORD v513[4];
  id v514;
  id v515;
  _QWORD v516[4];
  id v517;
  _QWORD v518[4];
  id v519;
  _QWORD v520[4];
  id v521;
  id *v522;
  id v523;
  _QWORD v524[4];
  id *v525;
  id v526;
  _QWORD v527[4];
  id *v528;
  id v529;
  id v530;
  id *v531;
  id *v532;
  id v533;
  _QWORD v534[4];
  id v535;
  id v536;
  _QWORD v537[4];
  id v538;
  _QWORD v539[4];
  id v540;
  _QWORD v541[4];
  id v542;
  _QWORD v543[4];
  id v544;
  id v545;
  _QWORD v546[4];
  id v547;
  id v548;
  id v549;
  _QWORD v550[4];
  id v551;
  id v552;
  _QWORD v553[4];
  id v554;
  _QWORD v555[4];
  id v556;
  _QWORD v557[4];
  id v558;
  _QWORD v559[4];
  id v560;
  _QWORD v561[4];
  id v562;
  id *v563;
  id v564;
  _QWORD v565[4];
  id v566;
  id v567;
  _QWORD v568[4];
  id v569;
  _QWORD v570[4];
  id v571;
  _QWORD v572[4];
  id v573;
  _QWORD v574[4];
  id v575;
  id v576;
  _QWORD v577[4];
  id v578;
  _QWORD v579[4];
  id *v580;
  id v581;
  _QWORD v582[4];
  id v583;
  _QWORD v584[4];
  id v585;
  _QWORD v586[4];
  id v587;
  _QWORD v588[4];
  id v589;
  _QWORD v590[4];
  id v591;
  _QWORD v592[4];
  id v593;
  id v594;
  _QWORD v595[2];
  _QWORD v596[2];
  const __CFString *v597;
  _QWORD v598[2];
  _QWORD v599[2];
  _QWORD v600[2];
  _QWORD v601[3];
  _QWORD v602[2];
  _QWORD v603[2];
  _QWORD v604[3];
  _QWORD v605[3];
  _QWORD v606[2];
  _QWORD v607[5];
  _QWORD v608[2];
  _QWORD v609[2];
  _QWORD v610[3];
  _QWORD v611[4];
  _QWORD v612[3];
  _QWORD v613[2];
  _QWORD v614[4];
  _QWORD v615[8];
  _QWORD v616[2];
  _QWORD v617[3];
  _QWORD v618[2];
  _QWORD v619[3];
  _QWORD v620[4];

  v620[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&v594, self);
  v592[0] = MEMORY[0x1E0C809B0];
  v592[1] = 3221225472;
  v592[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke;
  v592[3] = &unk_1E9F9D1A0;
  objc_copyWeak(&v593, &v594);
  v301 = (id *)_Block_copy(v592);
  v590[0] = MEMORY[0x1E0C809B0];
  v590[1] = 3221225472;
  v590[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4;
  v590[3] = &unk_1E9F9D1C8;
  objc_copyWeak(&v591, &v594);
  v2 = _Block_copy(v590);
  v588[0] = MEMORY[0x1E0C809B0];
  v588[1] = 3221225472;
  v588[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_621;
  v588[3] = &unk_1E9F9D1F0;
  v3 = v2;
  v589 = v3;
  v315 = (id *)_Block_copy(v588);
  v586[0] = MEMORY[0x1E0C809B0];
  v586[1] = 3221225472;
  v586[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_624;
  v586[3] = &unk_1E9F9D218;
  v296 = v3;
  v587 = v296;
  v313 = (id *)_Block_copy(v586);
  v584[0] = MEMORY[0x1E0C809B0];
  v584[1] = 3221225472;
  v584[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_627;
  v584[3] = &unk_1E9F9D240;
  objc_copyWeak(&v585, &v594);
  v4 = _Block_copy(v584);
  v582[0] = MEMORY[0x1E0C809B0];
  v582[1] = 3221225472;
  v582[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_649;
  v582[3] = &unk_1E9F9D268;
  objc_copyWeak(&v583, &v594);
  v5 = _Block_copy(v582);
  v579[0] = MEMORY[0x1E0C809B0];
  v579[1] = 3221225472;
  v579[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6;
  v579[3] = &unk_1E9F99650;
  objc_copyWeak(&v581, &v594);
  v300 = v5;
  v580 = v300;
  v6 = _Block_copy(v579);
  v577[0] = MEMORY[0x1E0C809B0];
  v577[1] = 3221225472;
  v577[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7;
  v577[3] = &unk_1E9F9D290;
  objc_copyWeak(&v578, &v594);
  v7 = _Block_copy(v577);
  v574[0] = MEMORY[0x1E0C809B0];
  v574[1] = 3221225472;
  v574[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_654;
  v574[3] = &unk_1E9F9D2B8;
  v8 = v7;
  v575 = v8;
  objc_copyWeak(&v576, &v594);
  v307 = (id *)_Block_copy(v574);
  v572[0] = MEMORY[0x1E0C809B0];
  v572[1] = 3221225472;
  v572[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_658;
  v572[3] = &unk_1E9F99C98;
  objc_copyWeak(&v573, &v594);
  v302 = (id *)_Block_copy(v572);
  v570[0] = MEMORY[0x1E0C809B0];
  v570[1] = 3221225472;
  v570[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_664;
  v570[3] = &unk_1E9F9D290;
  objc_copyWeak(&v571, &v594);
  v309 = (id *)_Block_copy(v570);
  v568[0] = MEMORY[0x1E0C809B0];
  v568[1] = 3221225472;
  v568[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_666;
  v568[3] = &unk_1E9F9D358;
  objc_copyWeak(&v569, &v594);
  v9 = _Block_copy(v568);
  v565[0] = MEMORY[0x1E0C809B0];
  v565[1] = 3221225472;
  v565[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_669;
  v565[3] = &unk_1E9F9D380;
  objc_copyWeak(&v567, &v594);
  v10 = v9;
  v566 = v10;
  v308 = (id *)_Block_copy(v565);
  v561[0] = MEMORY[0x1E0C809B0];
  v561[1] = 3221225472;
  v561[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_672;
  v561[3] = &unk_1E9F9D3A8;
  objc_copyWeak(&v564, &v594);
  v295 = v6;
  v562 = v295;
  v306 = (id *)v8;
  v563 = v306;
  v11 = _Block_copy(v561);
  v559[0] = MEMORY[0x1E0C809B0];
  v559[1] = 3221225472;
  v559[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_678;
  v559[3] = &unk_1E9F9D3D0;
  objc_copyWeak(&v560, &v594);
  v304 = (id *)_Block_copy(v559);
  v557[0] = MEMORY[0x1E0C809B0];
  v557[1] = 3221225472;
  v557[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_680;
  v557[3] = &unk_1E9F9D448;
  objc_copyWeak(&v558, &v594);
  v12 = _Block_copy(v557);
  v555[0] = MEMORY[0x1E0C809B0];
  v555[1] = 3221225472;
  v555[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_688;
  v555[3] = &unk_1E9F9D498;
  objc_copyWeak(&v556, &v594);
  location = (id *)_Block_copy(v555);
  v553[0] = MEMORY[0x1E0C809B0];
  v553[1] = 3221225472;
  v553[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_700;
  v553[3] = &unk_1E9F99C98;
  objc_copyWeak(&v554, &v594);
  v303 = (id *)_Block_copy(v553);
  v550[0] = MEMORY[0x1E0C809B0];
  v550[1] = 3221225472;
  v550[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_733;
  v550[3] = &unk_1E9F9D5A0;
  objc_copyWeak(&v552, &v594);
  v13 = v4;
  v551 = v13;
  v14 = _Block_copy(v550);
  v546[0] = MEMORY[0x1E0C809B0];
  v546[1] = 3221225472;
  v546[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_745;
  v546[3] = &unk_1E9F9D618;
  v15 = v11;
  v547 = v15;
  v16 = v14;
  v548 = v16;
  objc_copyWeak(&v549, &v594);
  v17 = _Block_copy(v546);
  v543[0] = MEMORY[0x1E0C809B0];
  v543[1] = 3221225472;
  v543[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8;
  v543[3] = &unk_1E9F9D640;
  objc_copyWeak(&v545, &v594);
  v18 = v16;
  v544 = v18;
  v19 = _Block_copy(v543);
  v541[0] = MEMORY[0x1E0C809B0];
  v541[1] = 3221225472;
  v541[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9;
  v541[3] = &unk_1E9F9D668;
  objc_copyWeak(&v542, &v594);
  v311 = (id *)_Block_copy(v541);
  v539[0] = MEMORY[0x1E0C809B0];
  v539[1] = 3221225472;
  v539[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10;
  v539[3] = &unk_1E9F9D668;
  objc_copyWeak(&v540, &v594);
  v20 = _Block_copy(v539);
  v21 = objc_loadWeakRetained(&v594);
  objc_msgSend(v21, "stateMachine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v537[0] = MEMORY[0x1E0C809B0];
  v537[1] = 3221225472;
  v537[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13;
  v537[3] = &unk_1E9F9BFC0;
  v23 = v12;
  v538 = v23;
  objc_msgSend(v22, "registerHandlerForEvent:onState:withBlock:", CFSTR("Present playlist"), CFSTR("Showing video full screen with post play content on screen"), v537);

  v24 = objc_loadWeakRetained(&v594);
  objc_msgSend(v24, "stateMachine");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v534[0] = MEMORY[0x1E0C809B0];
  v534[1] = 3221225472;
  v534[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_16;
  v534[3] = &unk_1E9F9B898;
  objc_copyWeak(&v536, &v594);
  v26 = v23;
  v535 = v26;
  objc_msgSend(v25, "registerHandlerForEvent:onState:withBlock:", CFSTR("Present playlist"), CFSTR("Showing post play content without playback UI"), v534);

  v27 = objc_loadWeakRetained(&v594);
  objc_msgSend(v27, "stateMachine");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v527[0] = MEMORY[0x1E0C809B0];
  v527[1] = 3221225472;
  v527[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19;
  v527[3] = &unk_1E9F9D708;
  objc_copyWeak(&v533, &v594);
  v305 = (id *)v26;
  v528 = v305;
  v29 = v15;
  v529 = v29;
  v30 = v13;
  v530 = v30;
  v293 = v313;
  v531 = v293;
  v316 = v315;
  v532 = v316;
  objc_msgSend(v28, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Present playlist"), v527);

  v31 = objc_loadWeakRetained(&v594);
  objc_msgSend(v31, "stateMachine");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v620[0] = CFSTR("Showing Extras content");
  v620[1] = CFSTR("Showing extras video picture in picture on extras content");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v620, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v524[0] = MEMORY[0x1E0C809B0];
  v524[1] = 3221225472;
  v524[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_779;
  v524[3] = &unk_1E9F9D730;
  v314 = (id *)v10;
  v525 = v314;
  objc_copyWeak(&v526, &v594);
  objc_msgSend(v32, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Present playlist"), v33, v524);

  v34 = objc_loadWeakRetained(&v594);
  objc_msgSend(v34, "stateMachine");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v520[0] = MEMORY[0x1E0C809B0];
  v520[1] = 3221225472;
  v520[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_782;
  v520[3] = &unk_1E9F9C0A8;
  objc_copyWeak(&v523, &v594);
  v36 = v29;
  v521 = v36;
  v299 = (id *)v30;
  v522 = v299;
  objc_msgSend(v35, "registerHandlerForEvent:onState:withBlock:", CFSTR("Present player container view controller"), CFSTR("Not showing anything"), v520);

  v37 = objc_loadWeakRetained(&v594);
  objc_msgSend(v37, "stateMachine");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v518[0] = MEMORY[0x1E0C809B0];
  v518[1] = 3221225472;
  v518[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_785;
  v518[3] = &unk_1E9F9BFC0;
  v294 = v17;
  v519 = v294;
  objc_msgSend(v38, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show multiview playback"), CFSTR("Not showing anything"), v518);

  v39 = objc_loadWeakRetained(&v594);
  objc_msgSend(v39, "stateMachine");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v516[0] = MEMORY[0x1E0C809B0];
  v516[1] = 3221225472;
  v516[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_786;
  v516[3] = &unk_1E9F9BFC0;
  v41 = v19;
  v517 = v41;
  objc_msgSend(v40, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show multiview playback"), CFSTR("Showing video full screen"), v516);

  v42 = objc_loadWeakRetained(&v594);
  objc_msgSend(v42, "stateMachine");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v513[0] = MEMORY[0x1E0C809B0];
  v513[1] = 3221225472;
  v513[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_787;
  v513[3] = &unk_1E9F9B898;
  objc_copyWeak(&v515, &v594);
  v44 = v20;
  v514 = v44;
  objc_msgSend(v43, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show multiview playback"), CFSTR("Showing multiview playback fullscreen"), v513);

  v45 = objc_loadWeakRetained(&v594);
  objc_msgSend(v45, "stateMachine");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v619[0] = CFSTR("Showing multiview playback");
  v619[1] = CFSTR("Showing multiview playback fullscreen");
  v619[2] = CFSTR("Showing multiview playback fullscreen due to small screen size");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v619, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v510[0] = MEMORY[0x1E0C809B0];
  v510[1] = 3221225472;
  v510[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15_839;
  v510[3] = &unk_1E9F9B898;
  objc_copyWeak(&v512, &v594);
  v48 = v36;
  v511 = v48;
  objc_msgSend(v46, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Dismiss multiview playback"), v47, v510);

  v49 = objc_loadWeakRetained(&v594);
  objc_msgSend(v49, "stateMachine");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v507[0] = MEMORY[0x1E0C809B0];
  v507[1] = 3221225472;
  v507[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19_843;
  v507[3] = &unk_1E9F9D730;
  v51 = v18;
  v508 = v51;
  objc_copyWeak(&v509, &v594);
  objc_msgSend(v50, "registerHandlerForEvent:onState:withBlock:", CFSTR("Add multiview playback"), CFSTR("Showing multiview playback"), v507);

  v52 = objc_loadWeakRetained(&v594);
  objc_msgSend(v52, "stateMachine");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v618[0] = CFSTR("Showing multiview playback fullscreen");
  v618[1] = CFSTR("Showing multiview playback fullscreen due to small screen size");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v618, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v504[0] = MEMORY[0x1E0C809B0];
  v504[1] = 3221225472;
  v504[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_22;
  v504[3] = &unk_1E9F9B898;
  objc_copyWeak(&v506, &v594);
  v55 = v44;
  v505 = v55;
  objc_msgSend(v53, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Add multiview playback"), v54, v504);

  v56 = objc_loadWeakRetained(&v594);
  objc_msgSend(v56, "stateMachine");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v502[0] = MEMORY[0x1E0C809B0];
  v502[1] = 3221225472;
  v502[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_24;
  v502[3] = &unk_1E9F9BFC0;
  v292 = v41;
  v503 = v292;
  objc_msgSend(v57, "registerHandlerForEvent:onState:withBlock:", CFSTR("Add multiview playback"), CFSTR("Showing video full screen"), v502);

  v58 = objc_loadWeakRetained(&v594);
  objc_msgSend(v58, "stateMachine");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v500[0] = MEMORY[0x1E0C809B0];
  v500[1] = 3221225472;
  v500[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_25;
  v500[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v501, &v594);
  objc_msgSend(v59, "registerHandlerForEvent:onState:withBlock:", CFSTR("Remove multiview playback"), CFSTR("Showing multiview playback"), v500);

  v60 = objc_loadWeakRetained(&v594);
  objc_msgSend(v60, "stateMachine");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v497[0] = MEMORY[0x1E0C809B0];
  v497[1] = 3221225472;
  v497[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_26;
  v497[3] = &unk_1E9F9B898;
  objc_copyWeak(&v499, &v594);
  v291 = v51;
  v498 = v291;
  objc_msgSend(v61, "registerHandlerForEvent:onState:withBlock:", CFSTR("Replace multiview playback"), CFSTR("Showing multiview playback"), v497);

  v62 = objc_loadWeakRetained(&v594);
  objc_msgSend(v62, "stateMachine");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v494[0] = MEMORY[0x1E0C809B0];
  v494[1] = 3221225472;
  v494[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_27;
  v494[3] = &unk_1E9F9B898;
  objc_copyWeak(&v496, &v594);
  v64 = v55;
  v495 = v64;
  objc_msgSend(v63, "registerHandlerForEvent:onState:withBlock:", CFSTR("Did select multiview player"), CFSTR("Showing multiview playback"), v494);

  v65 = objc_loadWeakRetained(&v594);
  objc_msgSend(v65, "stateMachine");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v491[0] = MEMORY[0x1E0C809B0];
  v491[1] = 3221225472;
  v491[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_28;
  v491[3] = &unk_1E9F9B898;
  objc_copyWeak(&v493, &v594);
  v312 = v311;
  v492 = v312;
  objc_msgSend(v66, "registerHandlerForEvent:onState:withBlock:", CFSTR("Multiview did enter fullscreen"), CFSTR("Showing multiview playback"), v491);

  v67 = objc_loadWeakRetained(&v594);
  objc_msgSend(v67, "stateMachine");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v617[0] = CFSTR("Showing video full screen");
  v617[1] = CFSTR("Showing multiview playback fullscreen");
  v617[2] = CFSTR("Showing multiview playback fullscreen due to small screen size");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v617, 3);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v488[0] = MEMORY[0x1E0C809B0];
  v488[1] = 3221225472;
  v488[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_31;
  v488[3] = &unk_1E9F9B898;
  objc_copyWeak(&v490, &v594);
  v290 = v316;
  v489 = v290;
  objc_msgSend(v68, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Media info did change"), v69, v488);

  v70 = objc_loadWeakRetained(&v594);
  objc_msgSend(v70, "stateMachine");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v616[0] = CFSTR("Showing multiview playback fullscreen");
  v616[1] = CFSTR("Showing multiview playback fullscreen due to small screen size");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v616, 2);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v485[0] = MEMORY[0x1E0C809B0];
  v485[1] = 3221225472;
  v485[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_847;
  v485[3] = &unk_1E9F9B898;
  objc_copyWeak(&v487, &v594);
  v297 = (id *)v64;
  v486 = v297;
  objc_msgSend(v71, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Multiview did exit fullscreen"), v72, v485);

  v73 = objc_loadWeakRetained(&v594);
  objc_msgSend(v73, "stateMachine");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v615[0] = CFSTR("Showing video full screen");
  v615[1] = CFSTR("Showing Extras content");
  v615[2] = CFSTR("Showing error message on playback UI");
  v615[3] = CFSTR("Showing video full screen with post play content on screen");
  v615[4] = CFSTR("Showing extras video full screen outside extras content");
  v615[5] = CFSTR("Showing post play content without playback UI");
  v615[6] = CFSTR("Showing multiview playback");
  v615[7] = CFSTR("Showing multiview playback fullscreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v615, 8);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v483[0] = MEMORY[0x1E0C809B0];
  v483[1] = 3221225472;
  v483[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_848;
  v483[3] = &unk_1E9F9BFC0;
  v76 = v48;
  v484 = v76;
  objc_msgSend(v74, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Dismiss playback"), v75, v483);

  v77 = objc_loadWeakRetained(&v594);
  objc_msgSend(v77, "stateMachine");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "registerHandlerForEvent:onState:withBlock:", CFSTR("Dismiss playback"), CFSTR("Waiting for AVPlayerViewController presentation to complete"), &__block_literal_global_850);

  v79 = objc_loadWeakRetained(&v594);
  objc_msgSend(v79, "stateMachine");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v614[0] = CFSTR("Waiting for Extras AVPlayerViewController presentation to complete");
  v614[1] = CFSTR("Showing main video picture in picture");
  v614[2] = CFSTR("Showing extras video picture in picture on extras content");
  v614[3] = CFSTR("Showing extras video picture in picture outside extras content");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v614, 4);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v481[0] = MEMORY[0x1E0C809B0];
  v481[1] = 3221225472;
  v481[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_851;
  v481[3] = &unk_1E9F9BFC0;
  v82 = v76;
  v482 = v82;
  objc_msgSend(v80, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Dismiss playback"), v81, v481);

  v83 = objc_loadWeakRetained(&v594);
  objc_msgSend(v83, "stateMachine");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v479[0] = MEMORY[0x1E0C809B0];
  v479[1] = 3221225472;
  v479[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_852;
  v479[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v480, &v594);
  objc_msgSend(v84, "registerHandlerForEvent:onState:withBlock:", CFSTR("Dismiss playback"), CFSTR("Playing background media in picture and picture"), v479);

  v85 = objc_loadWeakRetained(&v594);
  objc_msgSend(v85, "stateMachine");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v477[0] = MEMORY[0x1E0C809B0];
  v477[1] = 3221225472;
  v477[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_854;
  v477[3] = &unk_1E9F9BFC0;
  v87 = v82;
  v478 = v87;
  objc_msgSend(v86, "registerHandlerForEvent:onState:withBlock:", CFSTR("Done Button Pressed"), CFSTR("Showing Extras content"), v477);

  v88 = objc_loadWeakRetained(&v594);
  objc_msgSend(v88, "stateMachine");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v475[0] = MEMORY[0x1E0C809B0];
  v475[1] = 3221225472;
  v475[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_855;
  v475[3] = &unk_1E9F9BFC0;
  v317 = v309;
  v476 = v317;
  objc_msgSend(v89, "registerHandlerForEvent:onState:withBlock:", CFSTR("Done Button Pressed"), CFSTR("Showing extras video picture in picture on extras content"), v475);

  v90 = objc_loadWeakRetained(&v594);
  objc_msgSend(v90, "stateMachine");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v472[0] = MEMORY[0x1E0C809B0];
  v472[1] = 3221225472;
  v472[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_856;
  v472[3] = &unk_1E9F9B898;
  objc_copyWeak(&v474, &v594);
  v92 = v87;
  v473 = v92;
  objc_msgSend(v91, "registerHandlerForEvent:onState:withBlock:", CFSTR("AVPlayerViewController presentation did complete"), CFSTR("Waiting for AVPlayerViewController presentation to complete"), v472);

  v93 = objc_loadWeakRetained(&v594);
  objc_msgSend(v93, "stateMachine");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v469[0] = MEMORY[0x1E0C809B0];
  v469[1] = 3221225472;
  v469[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_860;
  v469[3] = &unk_1E9F9B898;
  objc_copyWeak(&v471, &v594);
  v95 = v308;
  v470 = v95;
  objc_msgSend(v94, "registerHandlerForEvent:onState:withBlock:", CFSTR("AVPlayerViewController presentation did complete"), CFSTR("Waiting for Extras AVPlayerViewController presentation to complete"), v469);

  v96 = objc_loadWeakRetained(&v594);
  objc_msgSend(v96, "stateMachine");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v466[0] = MEMORY[0x1E0C809B0];
  v466[1] = 3221225472;
  v466[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_862;
  v466[3] = &unk_1E9F9B898;
  objc_copyWeak(&v468, &v594);
  v98 = v92;
  v467 = v98;
  objc_msgSend(v97, "registerHandlerForEvent:onState:withBlock:", CFSTR("AVPlayerViewController presentation did complete"), CFSTR("Waiting for AVPlayerViewController presentation to complete to dismiss"), v466);

  v99 = objc_loadWeakRetained(&v594);
  objc_msgSend(v99, "stateMachine");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v464[0] = MEMORY[0x1E0C809B0];
  v464[1] = 3221225472;
  v464[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_864;
  v464[3] = &unk_1E9F9BFC0;
  v101 = v98;
  v465 = v101;
  objc_msgSend(v100, "registerHandlerForEvent:onState:withBlock:", CFSTR("AVPlayerViewController presentation did timeout"), CFSTR("Waiting for AVPlayerViewController presentation to complete"), v464);

  v102 = objc_loadWeakRetained(&v594);
  objc_msgSend(v102, "stateMachine");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v462[0] = MEMORY[0x1E0C809B0];
  v462[1] = 3221225472;
  v462[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_866;
  v462[3] = &unk_1E9F9BFC0;
  v104 = v101;
  v463 = v104;
  objc_msgSend(v103, "registerHandlerForEvent:onState:withBlock:", CFSTR("AVPlayerViewController presentation did timeout"), CFSTR("Waiting for AVPlayerViewController presentation to complete to dismiss"), v462);

  v105 = objc_loadWeakRetained(&v594);
  objc_msgSend(v105, "stateMachine");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v613[0] = CFSTR("Showing video full screen");
  v613[1] = CFSTR("Showing multiview playback fullscreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v613, 2);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v460[0] = MEMORY[0x1E0C809B0];
  v460[1] = 3221225472;
  v460[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_868;
  v460[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v461, &v594);
  objc_msgSend(v106, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Will start picture in picture"), v107, v460);

  v108 = objc_loadWeakRetained(&v594);
  objc_msgSend(v108, "stateMachine");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v458[0] = MEMORY[0x1E0C809B0];
  v458[1] = 3221225472;
  v458[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_869;
  v458[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v459, &v594);
  objc_msgSend(v109, "registerHandlerForEvent:onState:withBlock:", CFSTR("Will start picture in picture"), CFSTR("Showing multiview playback"), v458);

  v110 = objc_loadWeakRetained(&v594);
  objc_msgSend(v110, "stateMachine");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v455[0] = MEMORY[0x1E0C809B0];
  v455[1] = 3221225472;
  v455[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_870;
  v455[3] = &unk_1E9F9D730;
  v112 = v307;
  v456 = v112;
  objc_copyWeak(&v457, &v594);
  objc_msgSend(v111, "registerHandlerForEvent:onState:withBlock:", CFSTR("Will start picture in picture"), CFSTR("Showing extras video full screen outside extras content"), v455);

  v113 = objc_loadWeakRetained(&v594);
  objc_msgSend(v113, "stateMachine");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v453[0] = MEMORY[0x1E0C809B0];
  v453[1] = 3221225472;
  v453[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_871;
  v453[3] = &unk_1E9F9BFC0;
  v115 = v305;
  v454 = v115;
  objc_msgSend(v114, "registerHandlerForEvent:onState:withBlock:", CFSTR("Will start picture in picture"), CFSTR("Showing video full screen with post play content on screen"), v453);

  v116 = objc_loadWeakRetained(&v594);
  objc_msgSend(v116, "stateMachine");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v612[0] = CFSTR("Showing main video picture in picture");
  v612[1] = CFSTR("Showing multiview playback in PIP");
  v612[2] = CFSTR("Showing multiview playback fullscreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v612, 3);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v450[0] = MEMORY[0x1E0C809B0];
  v450[1] = 3221225472;
  v450[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_872;
  v450[3] = &unk_1E9F9B898;
  objc_copyWeak(&v452, &v594);
  v119 = v112;
  v451 = v119;
  objc_msgSend(v117, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Did start picture in picture"), v118, v450);

  v120 = objc_loadWeakRetained(&v594);
  objc_msgSend(v120, "stateMachine");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v448[0] = MEMORY[0x1E0C809B0];
  v448[1] = 3221225472;
  v448[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_873;
  v448[3] = &unk_1E9F9BFC0;
  v289 = v306;
  v449 = v289;
  objc_msgSend(v121, "registerHandlerForEvent:onState:withBlock:", CFSTR("Did start picture in picture"), CFSTR("Showing extras video picture in picture on extras content"), v448);

  v122 = objc_loadWeakRetained(&v594);
  objc_msgSend(v122, "stateMachine");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v445[0] = MEMORY[0x1E0C809B0];
  v445[1] = 3221225472;
  v445[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_874;
  v445[3] = &unk_1E9F9B898;
  objc_copyWeak(&v447, &v594);
  v288 = v119;
  v446 = v288;
  objc_msgSend(v123, "registerHandlerForEvent:onState:withBlock:", CFSTR("Did start picture in picture"), CFSTR("Showing multiview playback"), v445);

  v124 = objc_loadWeakRetained(&v594);
  objc_msgSend(v124, "stateMachine");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "registerHandlerForEvent:onState:withBlock:", CFSTR("Picture in picture presentation did fail"), CFSTR("Showing main video picture in picture"), &__block_literal_global_876);

  v126 = objc_loadWeakRetained(&v594);
  objc_msgSend(v126, "stateMachine");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v611[0] = CFSTR("Showing video full screen");
  v611[1] = CFSTR("Showing error message on playback UI");
  v611[2] = CFSTR("Showing multiview playback fullscreen");
  v611[3] = CFSTR("Showing multiview playback fullscreen due to small screen size");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v611, 4);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v442[0] = MEMORY[0x1E0C809B0];
  v442[1] = 3221225472;
  v442[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15_877;
  v442[3] = &unk_1E9F9B898;
  objc_copyWeak(&v444, &v594);
  v129 = v104;
  v443 = v129;
  objc_msgSend(v127, "registerHandlerForEvent:onStates:withBlock:", CFSTR("AVPlayerViewController did end full screen presentation"), v128, v442);

  v130 = objc_loadWeakRetained(&v594);
  objc_msgSend(v130, "stateMachine");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "registerHandlerForEvent:onState:withBlock:", CFSTR("AVPlayerViewController did end full screen presentation"), CFSTR("Transferring player to background media"), &__block_literal_global_880);

  v132 = objc_loadWeakRetained(&v594);
  objc_msgSend(v132, "stateMachine");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Restore user interface for picture in picture stop"), &__block_literal_global_882);

  v134 = objc_loadWeakRetained(&v594);
  objc_msgSend(v134, "stateMachine");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v610[0] = CFSTR("Showing main video picture in picture");
  v610[1] = CFSTR("Showing multiview playback in PIP");
  v610[2] = CFSTR("Showing multiview playback fullscreen in PIP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v610, 3);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v440[0] = MEMORY[0x1E0C809B0];
  v440[1] = 3221225472;
  v440[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_883;
  v440[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v441, &v594);
  objc_msgSend(v135, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Restore user interface for picture in picture stop"), v136, v440);

  v137 = objc_loadWeakRetained(&v594);
  objc_msgSend(v137, "stateMachine");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v438[0] = MEMORY[0x1E0C809B0];
  v438[1] = 3221225472;
  v438[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_887;
  v438[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v439, &v594);
  objc_msgSend(v138, "registerHandlerForEvent:onState:withBlock:", CFSTR("Restore user interface for picture in picture stop"), CFSTR("Showing extras video picture in picture on extras content"), v438);

  v139 = objc_loadWeakRetained(&v594);
  objc_msgSend(v139, "stateMachine");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v436[0] = MEMORY[0x1E0C809B0];
  v436[1] = 3221225472;
  v436[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_889;
  v436[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v437, &v594);
  objc_msgSend(v140, "registerHandlerForEvent:onState:withBlock:", CFSTR("Restore user interface for picture in picture stop"), CFSTR("Showing extras video picture in picture outside extras content"), v436);

  v141 = objc_loadWeakRetained(&v594);
  objc_msgSend(v141, "stateMachine");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v609[0] = CFSTR("Showing main video picture in picture");
  v609[1] = CFSTR("Showing multiview playback in PIP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v609, 2);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v433[0] = MEMORY[0x1E0C809B0];
  v433[1] = 3221225472;
  v433[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_891;
  v433[3] = &unk_1E9F9B898;
  objc_copyWeak(&v435, &v594);
  v144 = v129;
  v434 = v144;
  objc_msgSend(v142, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Did stop picture in picture"), v143, v433);

  v145 = objc_loadWeakRetained(&v594);
  objc_msgSend(v145, "stateMachine");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v608[0] = CFSTR("Showing extras video picture in picture on extras content");
  v608[1] = CFSTR("Showing extras video picture in picture outside extras content");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v608, 2);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v431[0] = MEMORY[0x1E0C809B0];
  v431[1] = 3221225472;
  v431[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_894;
  v431[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v432, &v594);
  objc_msgSend(v146, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Did stop picture in picture"), v147, v431);

  v148 = objc_loadWeakRetained(&v594);
  objc_msgSend(v148, "stateMachine");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v428[0] = MEMORY[0x1E0C809B0];
  v428[1] = 3221225472;
  v428[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_896;
  v428[3] = &unk_1E9F9B898;
  objc_copyWeak(&v430, &v594);
  v150 = v303;
  v429 = v150;
  objc_msgSend(v149, "registerHandlerForEvent:onState:withBlock:", CFSTR("Did stop picture in picture"), CFSTR("Showing video full screen"), v428);

  v151 = objc_loadWeakRetained(&v594);
  objc_msgSend(v151, "stateMachine");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v424[0] = MEMORY[0x1E0C809B0];
  v424[1] = 3221225472;
  v424[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_897;
  v424[3] = &unk_1E9F9C0A8;
  objc_copyWeak(&v427, &v594);
  v153 = v144;
  v425 = v153;
  v154 = v304;
  v426 = v154;
  objc_msgSend(v152, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Playback state did change"), v424);

  v155 = objc_loadWeakRetained(&v594);
  objc_msgSend(v155, "stateMachine");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v422[0] = MEMORY[0x1E0C809B0];
  v422[1] = 3221225472;
  v422[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_899;
  v422[3] = &unk_1E9F9BFC0;
  v157 = v115;
  v423 = v157;
  objc_msgSend(v156, "registerHandlerForEvent:onState:withBlock:", CFSTR("Playback state did change"), CFSTR("Waiting for playback to start to return to fullscreen"), v422);

  v158 = objc_loadWeakRetained(&v594);
  objc_msgSend(v158, "stateMachine");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "registerHandlerForEvent:onState:withBlock:", CFSTR("Playback state did change"), CFSTR("Showing video full screen with post play content on screen"), &__block_literal_global_902);

  v160 = objc_loadWeakRetained(&v594);
  objc_msgSend(v160, "stateMachine");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v416[0] = MEMORY[0x1E0C809B0];
  v416[1] = 3221225472;
  v416[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_904;
  v416[3] = &unk_1E9F9D870;
  objc_copyWeak(&v421, &v594);
  v162 = v153;
  v417 = v162;
  v163 = v95;
  v418 = v163;
  v310 = v150;
  v419 = v310;
  v164 = v154;
  v420 = v164;
  objc_msgSend(v161, "registerHandlerForEvent:onState:withBlock:", CFSTR("Playback state did change"), CFSTR("Showing video full screen"), v416);

  v165 = objc_loadWeakRetained(&v594);
  objc_msgSend(v165, "stateMachine");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "registerHandlerForEvent:onState:withBlock:", CFSTR("Playback state did change"), CFSTR("Waiting for Extras AVPlayerViewController presentation to complete"), &__block_literal_global_907);

  v167 = objc_loadWeakRetained(&v594);
  objc_msgSend(v167, "stateMachine");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v414[0] = MEMORY[0x1E0C809B0];
  v414[1] = 3221225472;
  v414[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_908;
  v414[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v415, &v594);
  objc_msgSend(v168, "registerHandlerForEvent:onState:withBlock:", CFSTR("Playback state did change"), CFSTR("Showing extras video picture in picture on extras content"), v414);

  v169 = objc_loadWeakRetained(&v594);
  objc_msgSend(v169, "stateMachine");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "registerHandlerForEvent:onState:withBlock:", CFSTR("Playback state did change"), CFSTR("Showing Extras content"), &__block_literal_global_911);

  v171 = objc_loadWeakRetained(&v594);
  objc_msgSend(v171, "stateMachine");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v607[0] = CFSTR("Waiting for AVPlayerViewController presentation to complete");
  v607[1] = CFSTR("Waiting for AVPlayerViewController presentation to complete to dismiss");
  v607[2] = CFSTR("Waiting for Extras AVPlayerViewController presentation to complete");
  v607[3] = CFSTR("Showing error message on playback UI");
  v607[4] = CFSTR("Showing error message without playback UI");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v607, 5);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Playback state did change"), v173, &__block_literal_global_913);

  v174 = objc_loadWeakRetained(&v594);
  objc_msgSend(v174, "stateMachine");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v410[0] = MEMORY[0x1E0C809B0];
  v410[1] = 3221225472;
  v410[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_914;
  v410[3] = &unk_1E9F9C0A8;
  objc_copyWeak(&v413, &v594);
  v176 = v162;
  v411 = v176;
  v287 = v164;
  v412 = v287;
  objc_msgSend(v175, "registerHandlerForEvent:onState:withBlock:", CFSTR("Playback state did change"), CFSTR("Showing error message without playback UI"), v410);

  v177 = objc_loadWeakRetained(&v594);
  objc_msgSend(v177, "stateMachine");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v408[0] = MEMORY[0x1E0C809B0];
  v408[1] = 3221225472;
  v408[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_916;
  v408[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v409, &v594);
  objc_msgSend(v178, "registerHandlerForEvent:onState:withBlock:", CFSTR("Playback state did change"), CFSTR("Showing multiview playback"), v408);

  v179 = objc_loadWeakRetained(&v594);
  objc_msgSend(v179, "stateMachine");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v405[0] = MEMORY[0x1E0C809B0];
  v405[1] = 3221225472;
  v405[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_917;
  v405[3] = &unk_1E9F9B898;
  objc_copyWeak(&v407, &v594);
  v286 = v302;
  v406 = v286;
  objc_msgSend(v180, "registerHandlerForEvent:onState:withBlock:", CFSTR("Extras button pressed"), CFSTR("Showing video full screen"), v405);

  v181 = objc_loadWeakRetained(&v594);
  objc_msgSend(v181, "stateMachine");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v606[0] = CFSTR("Showing Extras content");
  v606[1] = CFSTR("Showing extras video picture in picture on extras content");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v606, 2);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v403[0] = MEMORY[0x1E0C809B0];
  v403[1] = 3221225472;
  v403[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_918;
  v403[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v404, &v594);
  objc_msgSend(v182, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Extras menu item selected"), v183, v403);

  v184 = objc_loadWeakRetained(&v594);
  objc_msgSend(v184, "stateMachine");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v401[0] = MEMORY[0x1E0C809B0];
  v401[1] = 3221225472;
  v401[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_920;
  v401[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v402, &v594);
  objc_msgSend(v185, "registerHandlerForEvent:onState:withBlock:", CFSTR("Extras visibility needs update"), CFSTR("Showing video full screen"), v401);

  v186 = objc_loadWeakRetained(&v594);
  objc_msgSend(v186, "stateMachine");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v398[0] = MEMORY[0x1E0C809B0];
  v398[1] = 3221225472;
  v398[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_921;
  v398[3] = &unk_1E9F9B898;
  objc_copyWeak(&v400, &v594);
  v188 = v314;
  v399 = v188;
  objc_msgSend(v187, "registerHandlerForEvent:onState:withBlock:", CFSTR("Extras visibility needs update"), CFSTR("Showing Extras content"), v398);

  v189 = objc_loadWeakRetained(&v594);
  objc_msgSend(v189, "stateMachine");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v396[0] = MEMORY[0x1E0C809B0];
  v396[1] = 3221225472;
  v396[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_922;
  v396[3] = &unk_1E9F9BFC0;
  v285 = v317;
  v397 = v285;
  objc_msgSend(v190, "registerHandlerForEvent:onState:withBlock:", CFSTR("Extras visibility needs update"), CFSTR("Showing extras video picture in picture on extras content"), v396);

  v191 = objc_loadWeakRetained(&v594);
  objc_msgSend(v191, "stateMachine");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  v394[0] = MEMORY[0x1E0C809B0];
  v394[1] = 3221225472;
  v394[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_923;
  v394[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v395, &v594);
  objc_msgSend(v192, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Extras failure did occur"), v394);

  v193 = objc_loadWeakRetained(&v594);
  objc_msgSend(v193, "stateMachine");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v391[0] = MEMORY[0x1E0C809B0];
  v391[1] = 3221225472;
  v391[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_925;
  v391[3] = &unk_1E9F9D730;
  v195 = v188;
  v392 = v195;
  objc_copyWeak(&v393, &v594);
  objc_msgSend(v194, "registerHandlerForEvent:onState:withBlock:", CFSTR("Extras failure did occur"), CFSTR("Showing Extras content"), v391);

  v196 = objc_loadWeakRetained(&v594);
  objc_msgSend(v196, "stateMachine");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v389[0] = MEMORY[0x1E0C809B0];
  v389[1] = 3221225472;
  v389[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_927;
  v389[3] = &unk_1E9F9BFC0;
  v198 = v195;
  v390 = v198;
  objc_msgSend(v197, "registerHandlerForEvent:onState:withBlock:", CFSTR("Back button pressed"), CFSTR("Showing Extras content"), v389);

  v199 = objc_loadWeakRetained(&v594);
  objc_msgSend(v199, "stateMachine");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v385[0] = MEMORY[0x1E0C809B0];
  v385[1] = 3221225472;
  v385[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_928;
  v385[3] = &unk_1E9F9C0A8;
  objc_copyWeak(&v388, &v594);
  v284 = v300;
  v386 = v284;
  v201 = v198;
  v387 = v201;
  objc_msgSend(v200, "registerHandlerForEvent:onState:withBlock:", CFSTR("Back button pressed"), CFSTR("Showing extras video picture in picture on extras content"), v385);

  v202 = objc_loadWeakRetained(&v594);
  objc_msgSend(v202, "stateMachine");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v381[0] = MEMORY[0x1E0C809B0];
  v381[1] = 3221225472;
  v381[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_929;
  v381[3] = &unk_1E9F9C0A8;
  objc_copyWeak(&v384, &v594);
  v283 = v299;
  v382 = v283;
  v204 = v301;
  v383 = v204;
  objc_msgSend(v203, "registerHandlerForEvent:onState:withBlock:", CFSTR("Extras playback requested"), CFSTR("Showing Extras content"), v381);

  v205 = objc_loadWeakRetained(&v594);
  objc_msgSend(v205, "stateMachine");
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  v378[0] = MEMORY[0x1E0C809B0];
  v378[1] = 3221225472;
  v378[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_935;
  v378[3] = &unk_1E9F9B898;
  objc_copyWeak(&v380, &v594);
  v280 = v204;
  v379 = v280;
  objc_msgSend(v206, "registerHandlerForEvent:onState:withBlock:", CFSTR("Extras playback requested"), CFSTR("Showing extras video picture in picture on extras content"), v378);

  v207 = objc_loadWeakRetained(&v594);
  objc_msgSend(v207, "stateMachine");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v605[0] = CFSTR("Waiting for AVPlayerViewController presentation to complete");
  v605[1] = CFSTR("Waiting for AVPlayerViewController presentation to complete to dismiss");
  v605[2] = CFSTR("Waiting for Extras AVPlayerViewController presentation to complete");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v605, 3);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v376[0] = MEMORY[0x1E0C809B0];
  v376[1] = 3221225472;
  v376[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_938;
  v376[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v377, &v594);
  objc_msgSend(v208, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Error did occur"), v209, v376);

  v210 = objc_loadWeakRetained(&v594);
  objc_msgSend(v210, "stateMachine");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v604[0] = CFSTR("Showing video full screen");
  v604[1] = CFSTR("Showing video full screen with post play content on screen");
  v604[2] = CFSTR("Showing main video picture in picture");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v604, 3);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v373[0] = MEMORY[0x1E0C809B0];
  v373[1] = 3221225472;
  v373[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_939;
  v373[3] = &unk_1E9F9D730;
  v213 = v157;
  v374 = v213;
  objc_copyWeak(&v375, &v594);
  objc_msgSend(v211, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Error did occur"), v212, v373);

  v214 = objc_loadWeakRetained(&v594);
  objc_msgSend(v214, "stateMachine");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v603[0] = CFSTR("Showing error message on playback UI");
  v603[1] = CFSTR("Showing error message without playback UI");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v603, 2);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v368[0] = MEMORY[0x1E0C809B0];
  v368[1] = 3221225472;
  v368[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_1027;
  v368[3] = &unk_1E9F9D9F8;
  objc_copyWeak(&v372, &v594);
  v282 = v163;
  v369 = v282;
  v217 = v176;
  v370 = v217;
  v371 = &__block_literal_global_705;
  objc_msgSend(v215, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Error alert dismissed"), v216, v368);

  v218 = objc_loadWeakRetained(&v594);
  objc_msgSend(v218, "stateMachine");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "registerHandlerForEvent:onState:withBlock:", CFSTR("Download compatible video button pressed"), CFSTR("Showing error message on playback UI"), &__block_literal_global_1039);

  v220 = objc_loadWeakRetained(&v594);
  objc_msgSend(v220, "stateMachine");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v366[0] = MEMORY[0x1E0C809B0];
  v366[1] = 3221225472;
  v366[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1041;
  v366[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v367, &v594);
  objc_msgSend(v221, "registerHandlerForEvent:onState:withBlock:", CFSTR("Force streaming video button pressed"), CFSTR("Showing error message on playback UI"), v366);

  v222 = objc_loadWeakRetained(&v594);
  objc_msgSend(v222, "stateMachine");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v364[0] = MEMORY[0x1E0C809B0];
  v364[1] = 3221225472;
  v364[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1042;
  v364[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v365, &v594);
  objc_msgSend(v223, "registerHandlerForEvent:onState:withBlock:", CFSTR("Play using cellular data button pressed"), CFSTR("Showing error message on playback UI"), v364);

  v224 = objc_loadWeakRetained(&v594);
  objc_msgSend(v224, "stateMachine");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v602[0] = CFSTR("Showing multiview playback");
  v602[1] = CFSTR("Showing multiview playback in PIP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v602, 2);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  v361[0] = MEMORY[0x1E0C809B0];
  v361[1] = 3221225472;
  v361[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1044;
  v361[3] = &unk_1E9F9D730;
  v281 = v312;
  v362 = v281;
  objc_copyWeak(&v363, &v594);
  objc_msgSend(v225, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Application did enter background"), v226, v361);

  v227 = objc_loadWeakRetained(&v594);
  objc_msgSend(v227, "stateMachine");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  v359[0] = MEMORY[0x1E0C809B0];
  v359[1] = 3221225472;
  v359[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1045;
  v359[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v360, &v594);
  objc_msgSend(v228, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Application did enter background"), v359);

  v229 = objc_loadWeakRetained(&v594);
  objc_msgSend(v229, "stateMachine");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  v601[0] = CFSTR("Showing video full screen");
  v601[1] = CFSTR("Showing extras video full screen outside extras content");
  v601[2] = CFSTR("Showing video full screen with post play content on screen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v601, 3);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v356[0] = MEMORY[0x1E0C809B0];
  v356[1] = 3221225472;
  v356[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1046;
  v356[3] = &unk_1E9F9B898;
  objc_copyWeak(&v358, &v594);
  v232 = v310;
  v357 = v232;
  objc_msgSend(v230, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Application will enter foreground"), v231, v356);

  v233 = objc_loadWeakRetained(&v594);
  objc_msgSend(v233, "stateMachine");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v600[0] = CFSTR("Showing multiview playback");
  v600[1] = CFSTR("Showing multiview playback in PIP");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v600, 2);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v353[0] = MEMORY[0x1E0C809B0];
  v353[1] = 3221225472;
  v353[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1048;
  v353[3] = &unk_1E9F9D730;
  v279 = v297;
  v354 = v279;
  objc_copyWeak(&v355, &v594);
  objc_msgSend(v234, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Application will enter foreground"), v235, v353);

  v236 = objc_loadWeakRetained(&v594);
  objc_msgSend(v236, "stateMachine");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v351[0] = MEMORY[0x1E0C809B0];
  v351[1] = 3221225472;
  v351[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1049;
  v351[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v352, &v594);
  objc_msgSend(v237, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Application will enter foreground"), v351);

  v238 = objc_loadWeakRetained(&v594);
  objc_msgSend(v238, "stateMachine");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v349[0] = MEMORY[0x1E0C809B0];
  v349[1] = 3221225472;
  v349[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1051;
  v349[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v350, &v594);
  objc_msgSend(v239, "registerHandlerForEvent:onState:withBlock:", CFSTR("Application will resign active"), CFSTR("Showing Extras content"), v349);

  v240 = objc_loadWeakRetained(&v594);
  objc_msgSend(v240, "stateMachine");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v346[0] = MEMORY[0x1E0C809B0];
  v346[1] = 3221225472;
  v346[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1052;
  v346[3] = &unk_1E9F9B898;
  objc_copyWeak(&v348, &v594);
  v277 = v201;
  v347 = v277;
  objc_msgSend(v241, "registerHandlerForEvent:onState:withBlock:", CFSTR("Application did become active"), CFSTR("Showing Extras content"), v346);

  v242 = objc_loadWeakRetained(&v594);
  objc_msgSend(v242, "stateMachine");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v344[0] = MEMORY[0x1E0C809B0];
  v344[1] = 3221225472;
  v344[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1053;
  v344[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v345, &v594);
  objc_msgSend(v243, "registerHandlerForEvent:onState:withBlock:", CFSTR("External playback type did change"), CFSTR("Showing multiview playback"), v344);

  v244 = objc_loadWeakRetained(&v594);
  objc_msgSend(v244, "stateMachine");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v599[0] = CFSTR("Showing video full screen");
  v599[1] = CFSTR("Showing main video picture in picture");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v599, 2);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  v341[0] = MEMORY[0x1E0C809B0];
  v341[1] = 3221225472;
  v341[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1054;
  v341[3] = &unk_1E9F9B898;
  objc_copyWeak(&v343, &v594);
  v278 = location;
  v342 = v278;
  objc_msgSend(v245, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Post play configuration time reached"), v246, v341);

  v247 = objc_loadWeakRetained(&v594);
  objc_msgSend(v247, "stateMachine");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v338[0] = MEMORY[0x1E0C809B0];
  v338[1] = 3221225472;
  v338[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1055;
  v338[3] = &unk_1E9F9B898;
  objc_copyWeak(&v340, &v594);
  v249 = v232;
  v339 = v249;
  objc_msgSend(v248, "registerHandlerForEvent:onState:withBlock:", CFSTR("Post play has been configured"), CFSTR("Showing video full screen"), v338);

  v250 = objc_loadWeakRetained(&v594);
  objc_msgSend(v250, "stateMachine");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  v335[0] = MEMORY[0x1E0C809B0];
  v335[1] = 3221225472;
  v335[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1056;
  v335[3] = &unk_1E9F9B898;
  objc_copyWeak(&v337, &v594);
  v276 = v249;
  v336 = v276;
  objc_msgSend(v251, "registerHandlerForEvent:onState:withBlock:", CFSTR("Post play time boundary crossed"), CFSTR("Showing video full screen"), v335);

  v252 = objc_loadWeakRetained(&v594);
  objc_msgSend(v252, "stateMachine");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v332[0] = MEMORY[0x1E0C809B0];
  v332[1] = 3221225472;
  v332[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1057;
  v332[3] = &unk_1E9F9D730;
  v254 = v213;
  v333 = v254;
  objc_copyWeak(&v334, &v594);
  objc_msgSend(v253, "registerHandlerForEvent:onState:withBlock:", CFSTR("Post play cancelled"), CFSTR("Showing video full screen with post play content on screen"), v332);

  v255 = objc_loadWeakRetained(&v594);
  objc_msgSend(v255, "stateMachine");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v598[0] = CFSTR("Post play item selected");
  v598[1] = CFSTR("Post play auto play timer did complete");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v598, 2);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v597 = CFSTR("Showing video full screen with post play content on screen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v597, 1);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v328[0] = MEMORY[0x1E0C809B0];
  v328[1] = 3221225472;
  v328[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1058;
  v328[3] = &unk_1E9F9DA68;
  v275 = v254;
  v329 = v275;
  objc_copyWeak(&v331, &v594);
  v259 = v217;
  v330 = v259;
  objc_msgSend(v256, "registerHandlerForEvents:onStates:withBlock:", v257, v258, v328);

  v260 = objc_loadWeakRetained(&v594);
  objc_msgSend(v260, "stateMachine");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v325[0] = MEMORY[0x1E0C809B0];
  v325[1] = 3221225472;
  v325[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1063;
  v325[3] = &unk_1E9F9B898;
  objc_copyWeak(&v327, &v594);
  v262 = v259;
  v326 = v262;
  objc_msgSend(v261, "registerHandlerForEvent:onState:withBlock:", CFSTR("Post play hide playback"), CFSTR("Showing video full screen with post play content on screen"), v325);

  v263 = objc_loadWeakRetained(&v594);
  objc_msgSend(v263, "stateMachine");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  v596[0] = CFSTR("Showing video full screen with post play content on screen");
  v596[1] = CFSTR("Showing post play content without playback UI");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v596, 2);
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v323[0] = MEMORY[0x1E0C809B0];
  v323[1] = 3221225472;
  v323[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1065;
  v323[3] = &unk_1E9F9BFC0;
  v266 = v262;
  v324 = v266;
  objc_msgSend(v264, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Playback container did disappear"), v265, v323);

  v267 = objc_loadWeakRetained(&v594);
  objc_msgSend(v267, "stateMachine");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "registerHandlerForEvent:onState:withBlock:", CFSTR("Background media enter picture in picture"), CFSTR("Not showing anything"), &__block_literal_global_1067);

  v269 = objc_loadWeakRetained(&v594);
  objc_msgSend(v269, "stateMachine");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v321[0] = MEMORY[0x1E0C809B0];
  v321[1] = 3221225472;
  v321[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1068;
  v321[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v322, &v594);
  objc_msgSend(v270, "registerHandlerForEvent:onState:withBlock:", CFSTR("Background media picture in picture did end"), CFSTR("Playing background media in picture and picture"), v321);

  v271 = objc_loadWeakRetained(&v594);
  objc_msgSend(v271, "stateMachine");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  v595[0] = CFSTR("Showing video full screen");
  v595[1] = CFSTR("Showing multiview playback fullscreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v595, 2);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v318[0] = MEMORY[0x1E0C809B0];
  v318[1] = 3221225472;
  v318[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1069;
  v318[3] = &unk_1E9F9B898;
  objc_copyWeak(&v320, &v594);
  v274 = v266;
  v319 = v274;
  objc_msgSend(v272, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Transfer player to background media controller"), v273, v318);

  objc_destroyWeak(&v320);
  objc_destroyWeak(&v322);

  objc_destroyWeak(&v327);
  objc_destroyWeak(&v331);

  objc_destroyWeak(&v334);
  objc_destroyWeak(&v337);

  objc_destroyWeak(&v340);
  objc_destroyWeak(&v343);
  objc_destroyWeak(&v345);

  objc_destroyWeak(&v348);
  objc_destroyWeak(&v350);
  objc_destroyWeak(&v352);
  objc_destroyWeak(&v355);

  objc_destroyWeak(&v358);
  objc_destroyWeak(&v360);
  objc_destroyWeak(&v363);

  objc_destroyWeak(&v365);
  objc_destroyWeak(&v367);

  objc_destroyWeak(&v372);
  objc_destroyWeak(&v375);

  objc_destroyWeak(&v377);
  objc_destroyWeak(&v380);

  objc_destroyWeak(&v384);
  objc_destroyWeak(&v388);

  objc_destroyWeak(&v393);
  objc_destroyWeak(&v395);

  objc_destroyWeak(&v400);
  objc_destroyWeak(&v402);
  objc_destroyWeak(&v404);

  objc_destroyWeak(&v407);
  objc_destroyWeak(&v409);

  objc_destroyWeak(&v413);
  objc_destroyWeak(&v415);

  objc_destroyWeak(&v421);
  objc_destroyWeak(&v427);

  objc_destroyWeak(&v430);
  objc_destroyWeak(&v432);

  objc_destroyWeak(&v435);
  objc_destroyWeak(&v437);
  objc_destroyWeak(&v439);
  objc_destroyWeak(&v441);

  objc_destroyWeak(&v444);
  objc_destroyWeak(&v447);

  objc_destroyWeak(&v452);
  objc_destroyWeak(&v457);

  objc_destroyWeak(&v459);
  objc_destroyWeak(&v461);

  objc_destroyWeak(&v468);
  objc_destroyWeak(&v471);

  objc_destroyWeak(&v474);
  objc_destroyWeak(&v480);

  objc_destroyWeak(&v487);
  objc_destroyWeak(&v490);

  objc_destroyWeak(&v493);
  objc_destroyWeak(&v496);

  objc_destroyWeak(&v499);
  objc_destroyWeak(&v501);

  objc_destroyWeak(&v506);
  objc_destroyWeak(&v509);

  objc_destroyWeak(&v512);
  objc_destroyWeak(&v515);

  objc_destroyWeak(&v523);
  objc_destroyWeak(&v526);

  objc_destroyWeak(&v533);
  objc_destroyWeak(&v536);

  objc_destroyWeak(&v540);
  objc_destroyWeak(&v542);

  objc_destroyWeak(&v545);
  objc_destroyWeak(&v549);

  objc_destroyWeak(&v552);
  objc_destroyWeak(&v554);

  objc_destroyWeak(&v556);
  objc_destroyWeak(&v558);

  objc_destroyWeak(&v560);
  objc_destroyWeak(&v564);

  objc_destroyWeak(&v567);
  objc_destroyWeak(&v569);

  objc_destroyWeak(&v571);
  objc_destroyWeak(&v573);

  objc_destroyWeak(&v576);
  objc_destroyWeak(&v578);

  objc_destroyWeak(&v581);
  objc_destroyWeak(&v583);

  objc_destroyWeak(&v585);
  objc_destroyWeak(&v591);

  objc_destroyWeak(&v593);
  objc_destroyWeak(&v594);
}

- (void)_registerAudioSessionNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__audioSessionRouteDidChange_, *MEMORY[0x1E0C89870], 0);

}

- (void)_registerApplicationNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationWillResignActive_, *MEMORY[0x1E0DC4868], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__accountDidChange_, *MEMORY[0x1E0DC88B0], 0);

}

- (BOOL)isPIPing
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PIPStates();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

void __26__VUIPlaybackManager_init__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id WeakRetained;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  id v23;

  v23 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v23 && v6)
  {
    v8 = objc_msgSend(v23, "isEqualToString:", CFSTR("Not showing anything"));
    if (v8 != objc_msgSend(v6, "isEqualToString:", CFSTR("Not showing anything")))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0], WeakRetained);

    }
    PIPStates();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v23);

    PIPStates();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v6);

    if (v11 != (_DWORD)v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v15, VUIPlaybackManagerNotificationKeyIsPIPing[0]);

      objc_msgSend(*(id *)(a1 + 32), "activePlayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "vui_setObjectIfNotNil:forKey:", v16, VUIPlaybackManagerNotificationKeyPlayer[0]);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:userInfo:", VUIPlaybackManagerIsPIPingDidChangeNotification[0], WeakRetained, v14);

    }
    v18 = +[VUIPlaybackManager _isFullScreenPlaybackState:](VUIPlaybackManager, "_isFullScreenPlaybackState:", v23);
    if (v18 != +[VUIPlaybackManager _isFullScreenPlaybackState:](VUIPlaybackManager, "_isFullScreenPlaybackState:", v6))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationName:object:", VUIPlaybackManagerFullscreenPlaybackUIDidChangeNotification[0], 0);

    }
    v20 = +[VUIPlaybackManager _isShowingExtrasState:](VUIPlaybackManager, "_isShowingExtrasState:", v23);
    if (v20 != +[VUIPlaybackManager _isShowingExtrasState:](VUIPlaybackManager, "_isShowingExtrasState:", v6))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:", VUIPlaybackManagerShowingExtrasDidChangeNotification[0], 0);

    }
    v22 = objc_msgSend(v23, "isEqualToString:", CFSTR("Showing multiview playback"));
    if (v22 != objc_msgSend(v6, "isEqualToString:", CFSTR("Showing multiview playback")))
      objc_msgSend(WeakRetained, "_updateMultiviewReportingMetrics");
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  id v27;
  _BOOL4 v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  id WeakRetained;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  id val;
  objc_super v62;
  _QWORD v63[4];
  id v64;
  _QWORD block[4];
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id location;
  uint8_t v76[128];
  uint8_t buf[4];
  id v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  val = a4;
  v60 = a5;
  if ((void *)__PlayerAVPlayerKVOContext_0 == a6)
  {
    -[VUIPlaybackManager activePlayer](self, "activePlayer");
    v58 = (id)objc_claimAutoreleasedReturnValue();
    v10 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v78 = v58;
      v79 = 2112;
      v80 = val;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "AVPVC setPlayer late (KVO), activePlayer: %@, object: %@", buf, 0x16u);
    }
    if (v58 != val)
    {
      v11 = val;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v69;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v69 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
            objc_msgSend(v16, "player");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "playlist");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "playlist");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "isEqualToPlaylist:", v19);

            if (v20)
            {
              objc_msgSend(v16, "player");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_initWeak((id *)buf, v23);

              objc_msgSend(v16, "playerViewController");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_initWeak(&location, v24);

              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke_380;
              block[3] = &unk_1E9F9A8E8;
              objc_copyWeak(&v66, (id *)buf);
              objc_copyWeak(&v67, &location);
              dispatch_async(MEMORY[0x1E0C80D38], block);
              objc_destroyWeak(&v67);
              objc_destroyWeak(&v66);
              objc_destroyWeak(&location);
              objc_destroyWeak((id *)buf);
              goto LABEL_24;
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_24:

      goto LABEL_49;
    }
    -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v25 == val;

    if (v26)
    {
      -[VUIPlaybackManager mainAVPlayerViewController](self, "mainAVPlayerViewController");
      v57 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[VUIPlaybackManager extrasPlayer](self, "extrasPlayer");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = v27 == val;

      if (!v28)
      {
        v11 = 0;
LABEL_48:
        objc_initWeak((id *)buf, val);
        objc_initWeak(&location, v11);
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3221225472;
        v72[2] = __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v72[3] = &unk_1E9F9A8E8;
        objc_copyWeak(&v73, (id *)buf);
        objc_copyWeak(&v74, &location);
        dispatch_async(MEMORY[0x1E0C80D38], v72);
        objc_destroyWeak(&v74);
        objc_destroyWeak(&v73);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
LABEL_49:

        goto LABEL_50;
      }
      -[VUIPlaybackManager extrasAVPlayerViewController](self, "extrasAVPlayerViewController");
      v57 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (id)v57;
    goto LABEL_48;
  }
  if ((void *)__PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext == a6)
  {
    -[VUIPlaybackManager activePlayer](self, "activePlayer");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21 == val)
    {
      -[VUIPlaybackManager activePlayer](self, "activePlayer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "initialMediaItemHasCompletedInitialLoading");

      if (v35)
      {
        -[VUIPlaybackManager activePlayer](self, "activePlayer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "currentMediaItem");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38 && (objc_msgSend(v38, "complete") & 1) == 0)
        {
          objc_msgSend(v38, "addEndEventWithName:", *MEMORY[0x1E0DB1F10]);
          objc_msgSend(v38, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1EF0], *MEMORY[0x1E0DB1F40]);
        }
        -[VUIPlaybackManager activePlayer](self, "activePlayer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "currentMediaItem");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
          -[VUIPlaybackManager _setupFeaturesFromMainPlayersCurrentMediaItem](self, "_setupFeaturesFromMainPlayersCurrentMediaItem");
        -[VUIPlaybackManager initialPlaybackStartDate](self, "initialPlaybackStartDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v41)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIPlaybackManager setInitialPlaybackStartDate:](self, "setInitialPlaybackStartDate:", v42);

        }
        -[VUIPlaybackManager setAutoPlayedVideosCount:](self, "setAutoPlayedVideosCount:", -[VUIPlaybackManager autoPlayedVideosCount](self, "autoPlayedVideosCount") + 1);
        objc_msgSend(v40, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B80]);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "integerValue") == 3)
        {
          -[VUIPlaybackManager activePlayer](self, "activePlayer");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "externalPlaybackType");

          if (v45 == 2)
          {
            +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "setPreferAVAdapterCompatibility:", 1);

          }
        }
        +[VUIPostPlayUpsellConfig sharedInstance](VUIPostPlayUpsellConfig, "sharedInstance");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setHasShownPostPlay:", 0);

      }
    }
    else
    {

    }
  }
  else if ((void *)__PlayerAVPlayerViewControllerDisplaySizeKVOContext == a6)
  {
    -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v22 == val)
    {
      -[VUIPlaybackManager _notifyAVPlayerViewControllerDisplaySize](self, "_notifyAVPlayerViewControllerDisplaySize");
      -[VUIPlaybackManager _showOrUpdateAdvisoryViewsIfNeeded](self, "_showOrUpdateAdvisoryViewsIfNeeded");
      -[VUIPlaybackManager _updateMultiviewButtonState](self, "_updateMultiviewButtonState");
    }
  }
  else if ((void *)__PlayerMediaItemDurationKVOContext == a6)
  {
    -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    if (v29 == val)
    {
      -[VUIPlaybackManager _configureStillWatchingFeatureMonitoringIfLivePlayback](self, "_configureStillWatchingFeatureMonitoringIfLivePlayback");
      +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isPlayerTabsEnabled");

      if (v31)
      {
        objc_initWeak((id *)buf, self);
        +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke_384;
        v63[3] = &unk_1E9F99C98;
        objc_copyWeak(&v64, (id *)buf);
        objc_msgSend(v32, "updatePlayerTabsExcludingCanonicals:completion:", 0, v63);

        WeakRetained = objc_loadWeakRetained((id *)buf);
        objc_msgSend(WeakRetained, "_removeAdvisoryViews");

        objc_destroyWeak(&v64);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else if ((void *)__PlayerViewControllerFrameKVOContext == a6)
  {
    -[VUIPlaybackManager multiPlayerViewController](self, "multiPlayerViewController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val, "frame");
    v51 = objc_msgSend(v48, "isSupportedScreenSize:", v49, v50);

    if (v51)
    {
      -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager multiPlayerViewController](self, "multiPlayerViewController");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setDelegate:", v53);

      -[VUIPlaybackManager playbackContainerViewController](self, "playbackContainerViewController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager multiPlayerViewController](self, "multiPlayerViewController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "embedMultiPlayerViewController:", v55);

      -[VUIPlaybackManager multiPlayerViewController](self, "multiPlayerViewController");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "exitFullscreenWithCompletion:", 0);

      objc_msgSend(val, "removeObserver:forKeyPath:context:", self, CFSTR("frame"), __PlayerViewControllerFrameKVOContext);
      -[VUIPlaybackManager setTrackingPlayerViewFrame:](self, "setTrackingPlayerViewFrame:", 0);
    }
  }
  else
  {
    v62.receiver = self;
    v62.super_class = (Class)VUIPlaybackManager;
    -[VUIPlaybackManager observeValueForKeyPath:ofObject:change:context:](&v62, sel_observeValueForKeyPath_ofObject_change_context_, v59, val, v60, a6);
  }
LABEL_50:

}

void __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    objc_msgSend(v5, "avPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = WeakRetained;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "AVPVC setPlayer late (KVO), activePlayer: %@, AVPlayer: %@", (uint8_t *)&v10, 0x16u);

  }
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v8, "avPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayer:", v9);

}

void __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke_380(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    objc_msgSend(v5, "avPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = WeakRetained;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "AVPVC setPlayer late (KVO), activePlayer: %@, AVPlayer: %@", (uint8_t *)&v10, 0x16u);

  }
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v8, "avPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayer:", v9);

}

void __69__VUIPlaybackManager_observeValueForKeyPath_ofObject_change_context___block_invoke_384(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setupInfoTab");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_updateMultiviewButtonState");

}

- (void)presentPlaylist:(id)a3 fromViewController:(id)a4 dismissalOperation:(int64_t)a5 animated:(BOOL)a6 completion:(id)a7
{
  -[VUIPlaybackManager presentPlaylist:fromViewController:dismissalOperation:allowsCellular:animated:userInfo:completion:](self, "presentPlaylist:fromViewController:dismissalOperation:allowsCellular:animated:userInfo:completion:", a3, a4, a5, 0, a6, 0, a7);
}

- (void)presentPlaylist:(id)a3 fromViewController:(id)a4 dismissalOperation:(int64_t)a5 allowsCellular:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
  -[VUIPlaybackManager presentPlaylist:fromViewController:dismissalOperation:allowsCellular:animated:userInfo:completion:](self, "presentPlaylist:fromViewController:dismissalOperation:allowsCellular:animated:userInfo:completion:", a3, a4, a5, a6, a7, 0, a8);
}

- (void)presentPlaylist:(id)a3 fromViewController:(id)a4 dismissalOperation:(int64_t)a5 allowsCellular:(BOOL)a6 animated:(BOOL)a7 userInfo:(id)a8 completion:(id)a9
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  NSObject *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  void *v44;
  VUIPlaybackManager *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  int64_t v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v10 = a7;
  v11 = a6;
  v60 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = (void (**)(_QWORD))a9;
  v19 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CFSTR("NO");
    *(_DWORD *)buf = 138413570;
    v49 = v15;
    v50 = 2112;
    if (v11)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    v51 = v16;
    if (v10)
      v20 = CFSTR("YES");
    v52 = 2048;
    v53 = a5;
    v54 = 2112;
    v55 = v21;
    v56 = 2112;
    v57 = v20;
    v58 = 2112;
    v59 = v17;
    _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "presentPlaylist:%@, presentingViewController:%@, dismissalOperation:%ld, allowsCellular:%@, animated:%@, userInfo:%@", buf, 0x3Eu);
  }
  if (!v15
    || (objc_msgSend(v15, "trackList"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "count"),
        v22,
        !v23))
  {
    v41 = sLogObject_5;
    if (!os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v42 = "Not presenting playlist since playlist is empty";
    goto LABEL_26;
  }
  if (v16)
  {
    v45 = self;
    -[VUIPlaybackManager stateMachine](self, "stateMachine");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "currentState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v25;
    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("Showing main video picture in picture")) & 1) == 0
      && (objc_msgSend(v25, "isEqualToString:", CFSTR("Showing extras video picture in picture on extras content")) & 1) == 0
      && !objc_msgSend(v25, "isEqualToString:", CFSTR("Showing extras video picture in picture outside extras content")))
    {
      goto LABEL_16;
    }
    -[VUIPlaybackManager activePlayer](self, "activePlayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "playlist");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v15, "isEqualToPlaylist:", v27);

    if (!v28)
      goto LABEL_16;
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "groupActivitiesManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEligibleForSession");

    if ((v31 & 1) == 0)
    {
      v43 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v43, OS_LOG_TYPE_DEFAULT, "Content is already being played in PIP.  Calling stopPictureInPicture to restore to fullscreen", buf, 2u);
      }
      -[VUIPlaybackManager avPlayerViewController](v45, "avPlayerViewController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stopPictureInPicture");
    }
    else
    {
LABEL_16:
      -[VUIPlaybackManager configureAudioSessionForBackgroundPlayback:usingPlaybackCategory:isMultiview:](v45, "configureAudioSessionForBackgroundPlayback:usingPlaybackCategory:isMultiview:", 0, 0, 0);
      if (+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
        v32 = 2;
      else
        v32 = 0;
      v46[0] = CFSTR("PlaylistKey");
      v46[1] = CFSTR("PresentingViewControllerKey");
      v47[0] = v15;
      v47[1] = v16;
      v46[2] = CFSTR("DismissalOperationKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v47[2] = v33;
      v46[3] = CFSTR("AnimatedKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v47[3] = v34;
      v46[4] = CFSTR("AllowCellularUsageKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v47[4] = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v36, "mutableCopy");

      if (v17)
        objc_msgSend(v37, "addEntriesFromDictionary:", v17);
      if (v18)
      {
        v38 = _Block_copy(v18);
        v39 = (void *)objc_msgSend(v38, "copy");
        objc_msgSend(v37, "setObject:forKey:", v39, CFSTR("CompletionKey"));

      }
      -[VUIPlaybackManager stateMachine](v45, "stateMachine");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "postEvent:withContext:userInfo:", CFSTR("Present playlist"), 0, v37);

    }
    goto LABEL_35;
  }
  v41 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v42 = "Not presenting playlist since presenting view controller is nil";
LABEL_26:
    _os_log_impl(&dword_1D96EE000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 2u);
  }
LABEL_27:
  if (v18)
    v18[2](v18);
LABEL_35:

}

- (void)presentContainerViewController:(id)a3 withPlayer:(id)a4 andPlayerViewController:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "dictionary");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "vui_setObjectIfNotNil:forKey:", v14, CFSTR("PlaybackContainerKey"));

  objc_msgSend(v18, "vui_setObjectIfNotNil:forKey:", v12, CFSTR("PlayerViewControllerKey"));
  objc_msgSend(v18, "vui_setObjectIfNotNil:forKey:", v13, CFSTR("PlayerKey"));

  v15 = _Block_copy(v11);
  objc_msgSend(v18, "vui_setObjectIfNotNil:forKey:", v15, CFSTR("CompletionKey"));

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v16, "postEvent:withContext:userInfo:", CFSTR("Present player container view controller"), 0, v17);

}

- (void)presentExtrasWithURL:(id)a3 storeID:(id)a4 actionParams:(id)a5 fromViewController:(id)a6 completion:(id)a7
{
  -[VUIPlaybackManager presentExtrasWithURL:storeID:actionParams:hlsURL:fromViewController:completion:](self, "presentExtrasWithURL:storeID:actionParams:hlsURL:fromViewController:completion:", a3, a4, a5, 0, a6, a7);
}

- (void)presentExtrasWithURL:(id)a3 storeID:(id)a4 actionParams:(id)a5 hlsURL:(id)a6 fromViewController:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint8_t v32[8];
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v14 || !objc_msgSend(v15, "length") || !objc_msgSend(v16, "length"))
  {
    v29 = sLogObject_5;
    if (!os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)v32 = 0;
    v30 = "Not presenting extras since either extrasURL, storeID or actionsParams is invalid.";
    v31 = v29;
LABEL_14:
    _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_DEFAULT, v30, v32, 2u);
    goto LABEL_15;
  }
  v20 = sLogObject_5;
  v21 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (!v18)
  {
    if (!v21)
      goto LABEL_15;
    *(_WORD *)v32 = 0;
    v30 = "Not presenting extras since presenting view controller is nil";
    v31 = v20;
    goto LABEL_14;
  }
  if (v21)
  {
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "Presenting extras", v32, 2u);
  }
  v22 = *MEMORY[0x1E0DB1A00];
  v35[0] = *MEMORY[0x1E0DB1AC8];
  v35[1] = v22;
  v36[0] = v14;
  v36[1] = v16;
  v35[2] = *MEMORY[0x1E0DB1CB8];
  v36[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  if (v17)
    objc_msgSend(v24, "setObject:forKey:", v17, CFSTR("HLSURLKey"));
  v33[0] = CFSTR("PresentingViewControllerKey");
  v33[1] = CFSTR("DismissalOperationKey");
  v34[0] = v18;
  v34[1] = &unk_1EA0B9430;
  v33[2] = CFSTR("AnimatedKey");
  v33[3] = CFSTR("ExtrasDictionaryKey");
  v34[2] = MEMORY[0x1E0C9AAB0];
  v34[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  if (v19)
  {
    v27 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("CompletionKey"));

  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "postEvent:withContext:userInfo:", CFSTR("Present playlist"), 0, v26);

LABEL_15:
}

- (BOOL)isPlaylistBeingPresented:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (v4
    && (-[VUIPlaybackManager activePlayer](self, "activePlayer"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "playlist"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    -[VUIPlaybackManager activePlayer](self, "activePlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playlist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqualToPlaylist:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dismissPlaybackAnimated:(BOOL)a3 leaveGroupActivitySession:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v5 = a4;
  v6 = a3;
  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Dismiss playback", (uint8_t *)&v23, 2u);
  }
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "groupActivitiesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSessionActive");

  v13 = sLogObject_5;
  v14 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (!v14)
      goto LABEL_13;
    LOWORD(v23) = 0;
    v17 = "No session is active, ignoring leaveGroupActivitySession param";
LABEL_12:
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, 2u);
    goto LABEL_13;
  }
  if (!v5)
  {
    if (!v14)
      goto LABEL_13;
    LOWORD(v23) = 0;
    v17 = "Session is active but leaveGroupActivitySession is NO.  Not leaving session";
    goto LABEL_12;
  }
  if (v14)
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Session is active and leaveGroupActivitySession is YES.  Leaving session", (uint8_t *)&v23, 2u);
  }
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "groupActivitiesManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leaveSession");

LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6, v23, CFSTR("AnimatedKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (v8)
  {
    v21 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("CompletionKey"));

  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "postEvent:withContext:userInfo:", CFSTR("Dismiss playback"), 0, v20);

}

- (void)dismissPostPlayAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("PostPlaySlideOutAnimationKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Post play cancelled"), 0, v5);

}

- (void)presentMultiviewWithPlaylists:(id)a3 fromViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("AnimatedKey"));

  if (objc_msgSend(v13, "count"))
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("PlaylistsKey"));
  if (v8)
    objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("PresentingViewControllerKey"));
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v11, "postEvent:withContext:userInfo:", CFSTR("Show multiview playback"), 0, v12);

}

- (void)addPlaylistToMultiview:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[VUIPlaybackManager addPlaylistToMultiview:atIndex:animated:completion:](self, "addPlaylistToMultiview:atIndex:animated:completion:", a3, -1, a4, a5);
}

- (void)addPlaylistToMultiview:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a5;
  v17 = a3;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("AnimatedKey"));

  if (v17)
    objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("PlaylistKey"));
  if ((a4 & 0x8000000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("IndexKey"));

  }
  if (v10)
  {
    v14 = _Block_copy(v10);
    objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("CompletionKey"));

  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v15, "postEvent:withContext:userInfo:", CFSTR("Add multiview playback"), 0, v16);

}

- (void)replacePlaylistInMultiviewAtIndex:(int64_t)a3 withPlaylist:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("AnimatedKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("IndexKey"));

  if (v13)
    objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("PlaylistKey"));
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v11, "postEvent:withContext:userInfo:", CFSTR("Replace multiview playback"), 0, v12);

}

- (void)removePlaylistFromMultiview:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("AnimatedKey"));

  if (v10)
    objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("PlaylistKey"));
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("Remove multiview playback"), 0, v9);

}

- (void)removeFromMultiviewWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v6 = -[VUIPlaybackManager indexOfMediaItemInMultiviewWithIdentifier:](self, "indexOfMediaItemInMultiviewWithIdentifier:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 < v9)
    {
      -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v7);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playlist");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v15, "player");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "playlist");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[VUIPlaybackManager removePlaylistFromMultiview:animated:](self, "removePlaylistFromMultiview:animated:", v14, v4);
      }

    }
  }
}

- (BOOL)multiviewContainsMediaItemWithIdentifier:(id)a3
{
  return -[VUIPlaybackManager indexOfMediaItemInMultiviewWithIdentifier:](self, "indexOfMediaItemInMultiviewWithIdentifier:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)indexOfMediaItemInMultiviewWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v4 = a3;
  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = *MEMORY[0x1E0DB1A08];
    while (1)
    {
      -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "player");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v11, "currentMediaItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mediaItemMetadataForProperty:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v11) = objc_msgSend(v13, "isEqualToString:", v4);
      if ((v11 & 1) != 0)
        break;
      ++v7;
      -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v7 >= v15)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)multiviewPlayerCount
{
  void *v2;
  int64_t v3;

  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)maxMultiviewPlayerCount
{
  void *v2;
  void *v3;
  int64_t v4;

  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "multiviewConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maximumPlayerCount");

  return v4;
}

- (BOOL)isMultiviewPlaybackUIBeingShown
{
  void *v2;
  void *v3;
  char v4;

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Showing multiview playback"));

  return v4;
}

- (BOOL)isShowingExtras
{
  void *v2;
  void *v3;
  BOOL v4;

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[VUIPlaybackManager _isShowingExtrasState:](VUIPlaybackManager, "_isShowingExtrasState:", v3);

  return v4;
}

+ (BOOL)_isShowingExtrasState:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Showing Extras content")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Showing extras video picture in picture on extras content"));

  return v4;
}

- (BOOL)isPlaybackUIBeingShown
{
  void *v2;
  void *v3;
  char v4;

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Not showing anything")) ^ 1;

  return v4;
}

- (BOOL)isPIPingBackgroundPlayback
{
  void *v2;
  void *v3;

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("Playing background media in picture and picture"));
  return (char)v2;
}

- (TVPMediaItem)currentMediaItem
{
  void *v2;
  void *v3;

  -[VUIPlaybackManager activePlayer](self, "activePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TVPMediaItem *)v3;
}

- (BOOL)currentPlaylistAllowsCellular
{
  void *v2;
  char v3;

  -[VUIPlaybackManager activePlayer](self, "activePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsCellularUsage");

  return v3;
}

- (id)createPlayerViewController
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B448]), "initWithNibName:bundle:", 0, 0);
  -[VUIPlaybackManager _setupPlayerViewController:](self, "_setupPlayerViewController:", v3);
  return v3;
}

- (void)_setupPlayerViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  id location;

  v4 = a3;
  v5 = objc_initWeak(&location, self);
  objc_msgSend(v4, "setDelegate:", self);

  objc_msgSend(v4, "setEntersFullScreenWhenPlaybackBegins:", 1);
  objc_msgSend(v4, "setAllowsPictureInPicturePlayback:", 1);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("ForcePlaybackControls"));

  if (v7)
    objc_msgSend(v4, "setCanHidePlaybackControls:", 0);
  objc_destroyWeak(&location);

}

- (void)setBackgroundMediaControllerForPIP:(id)a3
{
  void *v5;
  const __CFString *v6;
  id v7;

  -[VUIPlaybackManager setPIPedBackgroundMediaController:](self, "setPIPedBackgroundMediaController:");
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (a3)
    v6 = CFSTR("Background media enter picture in picture");
  else
    v6 = CFSTR("Background media picture in picture did end");
  objc_msgSend(v5, "postEvent:", v6);

}

- (void)restoreBackgroundMediaControllerFromPIP:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  +[VUIApplicationRouter currentNavigationController](VUIApplicationRouter, "currentNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "rootViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "controllerPresenter");
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  -[VUIPlaybackManager PIPedBackgroundMediaController](self, "PIPedBackgroundMediaController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, v4);

}

- (void)setAvPlayerViewController:(id)a3
{
  AVPlayerViewController *v5;
  AVPlayerViewController *avPlayerViewController;
  AVPlayerViewController **p_avPlayerViewController;
  AVPlayerViewController *v8;

  v5 = (AVPlayerViewController *)a3;
  p_avPlayerViewController = &self->_avPlayerViewController;
  avPlayerViewController = self->_avPlayerViewController;
  v8 = v5;
  if (avPlayerViewController != v5)
  {
    if (avPlayerViewController)
      -[AVPlayerViewController removeObserver:forKeyPath:context:](avPlayerViewController, "removeObserver:forKeyPath:context:", self, CFSTR("videoBounds"), __PlayerAVPlayerViewControllerDisplaySizeKVOContext);
    objc_storeStrong((id *)&self->_avPlayerViewController, a3);
    if (*p_avPlayerViewController)
      -[AVPlayerViewController addObserver:forKeyPath:options:context:](*p_avPlayerViewController, "addObserver:forKeyPath:options:context:", self, CFSTR("videoBounds"), 0, __PlayerAVPlayerViewControllerDisplaySizeKVOContext);
  }

}

- (void)setActivePlayer:(id)a3
{
  VUIPlayer **p_activePlayer;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_activePlayer = &self->_activePlayer;
  WeakRetained = objc_loadWeakRetained((id *)p_activePlayer);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_activePlayer, obj);
    v6 = obj;
  }

}

- (BOOL)_audioContainsAirPlayRoute
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    v8 = (void *)*MEMORY[0x1E0C897C0];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "portType", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == v8)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_audioContainsHDMIRoute
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    v8 = (void *)*MEMORY[0x1E0C89838];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "portType", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 == v8)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)configureAudioSessionForBackgroundPlayback:(BOOL)a3 usingPlaybackCategory:(BOOL)a4 isMultiview:(BOOL)a5
{
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  _QWORD block[4];
  BOOL v14;
  char v15;
  BOOL v16;
  BOOL v17;

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Not showing anything")) ^ 1;

  -[VUIPlaybackManager audioSessionSerialQueue](self, "audioSessionSerialQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v14 = a3;
  v15 = v11;
  v16 = a4;
  v17 = a5;
  dispatch_async(v12, block);

}

void __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke(_BYTE *a1)
{
  NSObject *v2;
  NSObject *v3;
  char v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  _QWORD v11[4];
  char v12;
  uint8_t buf[16];

  if (!a1[32])
  {
    v3 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Setting the audio category to AVAudioSessionCategoryPlayback, mode:AVAudioSessionModeMoviePlayback, routing: AVAudioSessionRouteSharingPolicyLongFormVideo", buf, 2u);
    }
    v4 = a1[35];
    objc_msgSend(MEMORY[0x1E0DB1908], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke_411;
    v11[3] = &__block_descriptor_33_e24_v16__0__AVAudioSession_8l;
    v12 = v4;
    v7 = v11;
    goto LABEL_15;
  }
  if (!a1[33])
  {
    v8 = a1[34];
    v9 = sLogObject_5;
    v10 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Setting the audio category to AVAudioSessionCategoryPlayback, mode:AVAudioSessionModeDefault", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0DB1908], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &__block_literal_global_408;
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Setting the audio category to AVAudioSessionCategoryAmbient, mode:AVAudioSessionModeDefault", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0DB1908], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = &__block_literal_global_410;
    }
LABEL_15:
    objc_msgSend(v5, "setConfigurationBlock:", v7);

    return;
  }
  v2 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to set audio category to AVAudioSessionCategoryAmbient since playback is happening either fullscreen or in PIP", buf, 2u);
  }
}

void __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke_406(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C89690];
  v3 = *MEMORY[0x1E0C89748];
  v7 = 0;
  v4 = objc_msgSend(a2, "setCategory:mode:options:error:", v2, v3, 0, &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    v6 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Failed to set audio session playback category: %@", buf, 0xCu);
    }
  }

}

void __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke_409(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C89660];
  v3 = *MEMORY[0x1E0C89748];
  v7 = 0;
  v4 = objc_msgSend(a2, "setCategory:mode:options:error:", v2, v3, 0, &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    v6 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Failed to set audio session playback category: %@", buf, 0xCu);
    }
  }

}

void __99__VUIPlaybackManager_configureAudioSessionForBackgroundPlayback_usingPlaybackCategory_isMultiview___block_invoke_411(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C89690];
  v4 = *MEMORY[0x1E0C89760];
  v16 = 0;
  v5 = a2;
  LOBYTE(v4) = objc_msgSend(v5, "setCategory:mode:routeSharingPolicy:options:error:", v3, v4, 3, 0, &v16);
  v6 = v16;
  if ((v4 & 1) == 0)
  {
    v7 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Failed to set audio session playback category: %@", buf, 0xCu);
    }
  }
  v8 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    VUIBoolLogString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Setting prefers concurrent air play audio %@", buf, 0xCu);

  }
  v11 = *(unsigned __int8 *)(a1 + 32);
  v15 = v6;
  v12 = objc_msgSend(v5, "setPrefersConcurrentAirPlayAudio:error:", v11, &v15);

  v13 = v15;
  if ((v12 & 1) == 0)
  {
    v14 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Failed to set prefers concurrent air play audio %@", buf, 0xCu);
    }
  }

}

- (VUIControllerPresenter)fullScreenViewControllerForPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[VUIPlaybackManager isFullscreenPlaybackUIBeingShown](self, "isFullscreenPlaybackUIBeingShown")
    || (-[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "vui_viewControllerForFullScreenPresentation"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (VUIControllerPresenter *)v4;
}

- (BOOL)isPostPlayActive
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Showing video full screen with post play content on screen")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[VUIPlaybackManager stateMachine](self, "stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("Showing post play content without playback UI"));

  }
  return v5;
}

- (void)transferPlaybackToBackgroundMediaController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v5 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("CompletionKey"));

  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Transfer player to background media controller"), 0, v7);

}

- (void)startPictureInPicture
{
  id v2;

  -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startPictureInPicture");

}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__VUIPlaybackManager_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v9[3] = &unk_1E9F9CFA0;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_415, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __97__VUIPlaybackManager_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;

  if ((objc_msgSend(a2, "isCancelled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "stateMachine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postEvent:withContext:", CFSTR("AVPlayerViewController did end full screen presentation"), *(_QWORD *)(a1 + 32));

  }
}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "playerViewControllerWillStartPictureInPicture: %@", buf, 0xCu);
  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("PlayerViewControllerKey");
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Will start picture in picture"), 0, v7);

}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "playerViewControllerDidStartPictureInPicture: %@", (uint8_t *)&v9, 0xCu);
  }
  -[VUIPlaybackManager _markMainPlayerMediaItemPlayingPictureInPictureMetadataAsActive:forAVPlayerViewController:](self, "_markMainPlayerMediaItemPlayingPictureInPictureMetadataAsActive:forAVPlayerViewController:", 1, v4);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vui_setObjectIfNotNil:forKey:", v4, CFSTR("PlayerViewControllerKey"));
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Did start picture in picture"), 0, v8);

}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "playerViewController:failedToStartPictureInPictureWithError: %@, %@", (uint8_t *)&v10, 0x16u);
  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postEvent:", CFSTR("Picture in picture presentation did fail"));

}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "playerViewControllerWillStopPictureInPicture: %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VUIPlaybackManager_playerViewControllerWillStopPictureInPicture___block_invoke;
  block[3] = &unk_1E9F98DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __67__VUIPlaybackManager_playerViewControllerWillStopPictureInPicture___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Will stop picture in picture"));

}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "playerViewControllerDidStopPictureInPicture: %@", buf, 0xCu);
  }
  -[VUIPlaybackManager _markMainPlayerMediaItemPlayingPictureInPictureMetadataAsActive:forAVPlayerViewController:](self, "_markMainPlayerMediaItemPlayingPictureInPictureMetadataAsActive:forAVPlayerViewController:", 0, v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__VUIPlaybackManager_playerViewControllerDidStopPictureInPicture___block_invoke;
  v7[3] = &unk_1E9F98FD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __66__VUIPlaybackManager_playerViewControllerDidStopPictureInPicture___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v5 = CFSTR("PlayerViewControllerKey");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Did stop picture in picture"), 0, v4);

}

- (id)playerViewController:(id)a3 displayNameForMediaSelectionOption:(id)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(v4, "vui_localizedDisplayNameOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "App providing localized display name for %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  const __CFString *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "playerViewController:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler: %@", buf, 0xCu);
  }
  if (v7)
  {
    v14 = CFSTR("CompletionKey");
    v9 = (void *)objc_msgSend(v7, "copy");
    v15 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __108__VUIPlaybackManager_playerViewController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E9F98FD8;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __108__VUIPlaybackManager_playerViewController_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Restore user interface for picture in picture stop"), 0, *(_QWORD *)(a1 + 40));

}

- (void)playerViewController:(id)a3 contentViewWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23[3];
  id location;
  const __CFString *v25;
  _QWORD v26[2];

  height = a4.height;
  width = a4.width;
  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  -[VUIPlaybackManager skipButton](self, "skipButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else
  {
    -[VUIPlaybackManager promoMetadataView](self, "promoMetadataView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_5;
  }
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __101__VUIPlaybackManager_playerViewController_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v21[3] = &unk_1E9F9CFC8;
  v23[1] = *(id *)&width;
  v23[2] = *(id *)&height;
  v21[4] = self;
  objc_copyWeak(v23, &location);
  v22 = v9;
  objc_msgSend(v10, "animateAlongsideTransition:completion:", v21, &__block_literal_global_417);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
LABEL_5:
  -[VUIPlaybackManager extrasContext](self, "extrasContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "shouldExtrasBeVisibleForSize:", width, height))
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "groupActivitiesManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isSessionActive");

    v17 = v16 ^ 1u;
  }
  else
  {
    v17 = 0;
  }

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = CFSTR("ExtrasShouldBeVisibleKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postEvent:withContext:userInfo:", CFSTR("Extras visibility needs update"), 0, v20);

}

void __101__VUIPlaybackManager_playerViewController_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  char v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  id v44;

  v44 = a2;
  v3 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClassForWindowWidth:", *(double *)(a1 + 56));
  v4 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClassForWindowWidth:", *(double *)(a1 + 64));
  v5 = v4;
  if ((unint64_t)(v3 - 4) < 3)
  {
    if ((unint64_t)(v4 - 3) >= 4)
      v6 = 34.0;
    else
      v6 = 80.0;
    if ((unint64_t)(v4 - 3) >= 4)
      v7 = 90.0;
    else
      v7 = 80.0;
LABEL_8:
    v8 = 1;
    goto LABEL_12;
  }
  v7 = 0.0;
  if (v3 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "promoMetadataView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      if ((unint64_t)(v5 - 3) >= 4)
        v7 = 90.0;
      else
        v7 = 80.0;
      if ((unint64_t)(v5 - 3) >= 4)
        v6 = 34.0;
      else
        v6 = 80.0;
      goto LABEL_8;
    }
  }
  v8 = 0;
  v6 = 34.0;
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "skipButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "promoMetadataView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_31;
    objc_msgSend(*(id *)(a1 + 32), "promoMetadataView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "vui_sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    v20 = v19;
    v22 = v21;

    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "promoMetadataView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "vuiIsRTL");

      VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      objc_msgSend(*(id *)(a1 + 32), "promoMetadataView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

      v34 = *(void **)(a1 + 40);
      if (!v24)
      {
        v42 = v7 + v30;
        v35 = 0.0;
        v36 = 0.0;
        goto LABEL_30;
      }
      v35 = v26 + v30;
      v36 = 0.0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "promoMetadataView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setFrame:", (*(double *)(a1 + 56) - v20) * 0.5, *(double *)(a1 + 64) - v22 - v6, v20, v22);

      v34 = *(void **)(a1 + 40);
      v36 = v6 + v22;
      v35 = 0.0;
    }
    v42 = 0.0;
LABEL_30:
    objc_msgSend(v34, "setLegibleContentInsets:", 0.0, v35, v36, v42);
    goto LABEL_31;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12 = WeakRetained;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "skipCenterXConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 0);

    v14 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v14, "skipTrailingConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setConstant:", -v7);

    v16 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v16, "skipTrailingConstraint");
  }
  else
  {
    objc_msgSend(WeakRetained, "skipTrailingConstraint");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 0);

    v16 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v16, "skipCenterXConstraint");
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  v39 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v39, "skipBottomConstraint");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setConstant:", -v6);

LABEL_31:
  objc_msgSend(*(id *)(a1 + 40), "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setNeedsLayout");

}

- (void)extrasRequestsMediaPlayback:(id)a3 isBackground:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a4;
    v6 = a3;
    v7 = (void *)objc_opt_new();
    -[VUIPlaybackManager extrasContext](self, "extrasContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tvpMediaItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "playlistForIKMediaElements:withMediaItem:isExtrasContent:", v6, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[VUIPlaybackManager stateMachine](self, "stateMachine");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = CFSTR("PlaylistKey");
      v14[1] = CFSTR("IsBackgroundPlaybackKey");
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postEvent:withContext:userInfo:", CFSTR("Extras playback requested"), 0, v13);

    }
  }
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[VUIPlaybackManager setTransportBarVisible:](self, "setTransportBarVisible:", v5);
  if (v5)
  {
    -[VUIPlaybackManager activePlayer](self, "activePlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "loading");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v10)
      -[VUIPlaybackManager _resetAutoPlayBingeWatchingQualifications](self, "_resetAutoPlayBingeWatchingQualifications");
    -[VUIPlaybackManager activePlayer](self, "activePlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentMediaItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataMakeAdditionalPlayerTabsRequest"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v7, "customInfoViewControllers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    v17 = (void *)sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      VUIBoolLogString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v19;
      v26 = 2048;
      v27 = v16;
      _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "Make additional player tabs call? %@ playerTabCount %llu", (uint8_t *)&v24, 0x16u);

    }
    if (v16)
      v20 = v14;
    else
      v20 = 1;
    if (v20 == 1)
    {
      +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager multiviewIdentifiers](self, "multiviewIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copy");
      objc_msgSend(v21, "updatePlayerTabsExcludingCanonicals:completion:", v23, 0);

    }
  }
  else
  {
    -[VUIPlaybackManager _addSkipIntroFeatureToMonitorIfNeeded](self, "_addSkipIntroFeatureToMonitorIfNeeded");
  }

}

- (void)extrasDoneButtonPressed
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("AnimatedKey");
  v5[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Done Button Pressed"), 0, v3);

}

- (void)extrasMenuItemSelected:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("MenuItemElementKey");
  v10[1] = CFSTR("MenuItemIndexKey");
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Extras menu item selected"), 0, v9);
}

- (void)extrasBackButtonPressed
{
  id v2;

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Back button pressed"));

}

- (void)extrasContext:(id)a3 hadFatalError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;

  v5 = a4;
  v6 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
    -[VUIPlaybackManager extrasContext:hadFatalError:].cold.1((uint64_t)v5, v6);
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postEvent:", CFSTR("Extras failure did occur"));

}

- (void)extrasContextDidLoadMainMenuItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIPlaybackManager extrasContext](self, "extrasContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainMenuItemElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v19 = 134217984;
    v20 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Extras context did load %lu main menu items", (uint8_t *)&v19, 0xCu);

  }
  -[VUIPlaybackManager extrasControlItem](self, "extrasControlItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 && objc_msgSend(v6, "count"))
  {
    -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;

    if (objc_msgSend(v4, "shouldExtrasBeVisibleForSize:", v13, v15))
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "groupActivitiesManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isSessionActive") ^ 1;

    }
    else
    {
      v18 = 0;
    }
    -[VUIPlaybackManager _setExtrasButtonVisible:](self, "_setExtrasButtonVisible:", v18);
  }

}

- (void)extrasContext:(id)a3 extrasVisibilityNeedsUpdate:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v4 = a4;
  v9[1] = *MEMORY[0x1E0C80C00];
  -[VUIPlaybackManager stateMachine](self, "stateMachine", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("ExtrasShouldBeVisibleKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Extras visibility needs update"), 0, v7);

}

- (void)featureMonitor:(id)a3 featureDidChangeState:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a5;
  v7 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F02A04C8))
  {
    -[VUIPlaybackManager _updateTimeBoundFeature:animated:](self, "_updateTimeBoundFeature:animated:", v7, v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VUIPlaybackManager _updateTimeTriggeredFeature:animated:](self, "_updateTimeTriggeredFeature:animated:", v7, v5);
  }

}

- (void)playbackContainerViewControllerDidFinishLoadingPostPlay:(id)a3
{
  id v3;

  -[VUIPlaybackManager stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:withContext:userInfo:", CFSTR("Post play has been configured"), 0, 0);

}

- (void)playbackContainerViewControllerExitPictureInPicturePressed:(id)a3
{
  id v3;

  -[VUIPlaybackManager stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Post play cancelled"));

}

- (void)playbackContainerViewControllerBackgroundPlaybackWillBegin:(id)a3
{
  id v3;

  -[VUIPlaybackManager stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Post play hide playback"));

}

- (void)playbackContainerViewControllerDidDisappear:(id)a3
{
  id v3;

  -[VUIPlaybackManager stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Playback container did disappear"));

}

- (void)playbackContainerViewControllerWillTransitionToSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePlayerViewSize:", width, height);

}

- (NSArray)multiviewIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0DB1A08];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "player");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currentMediaItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "mediaItemMetadataForProperty:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v3, "addObject:", v12);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)mediaSupportsStartOver
{
  void *v2;
  void *v3;
  char v4;

  -[VUIPlaybackManager currentMediaItem](self, "currentMediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataSupportsStartOver"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)_playbackStateDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DB1F60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Playback state did change to %@", (uint8_t *)&v11, 0xCu);
  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("Playback state did change"), v9, v10);
}

- (void)_currentMediaItemDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  -[VUIPlaybackManager _updateRequiresLinearPlayback](self, "_updateRequiresLinearPlayback", a3);
  -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFeaturesMatching:", &unk_1EA0BB880);

  -[VUIPlaybackManager currentMediaItem](self, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VUIPlaybackManager currentMediaItem](self, "currentMediaItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackManager _donateUserActivityForMediaItem:](self, "_donateUserActivityForMediaItem:", v6);

    -[VUIPlaybackManager stateMachine](self, "stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Showing multiview playback"));

    if ((v9 & 1) == 0)
    {
      +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "resetPlayerTabsForPlayerViewController:", v10);

    }
  }
}

- (void)_playbackErrorDidOccur:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Error did occur"), v5, v6);
}

- (void)_externalPlaybackTypeDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    v6 = (void *)sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134217984;
      v15 = objc_msgSend(v8, "externalPlaybackType");
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "ExternalPlaybacktype did change externalPlaybackType = %ld", (uint8_t *)&v14, 0xCu);

    }
    -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "externalPlaybackType") != 0;

    objc_msgSend(v9, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setExcludedControls:", 32 * v11);
    objc_msgSend(v9, "setConfiguration:", v12);

  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postEvent:", CFSTR("External playback type did change"));

}

- (void)_networkReachbilityDidChange:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC6A38], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isNetworkReachable");

  v6 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v5)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v24 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Network reachability did change. Is reachable: %@", buf, 0xCu);
  }
  -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  if (v5)
  {
    -[VUIPlaybackManager extrasContext](self, "extrasContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "shouldExtrasBeVisibleForSize:", v11, v13))
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "groupActivitiesManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isSessionActive") ^ 1;

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17, CFSTR("ExtrasShouldBeVisibleKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postEvent:withContext:userInfo:", CFSTR("Extras visibility needs update"), 0, v20);

}

- (void)_playerRateDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Player rate did change %@", (uint8_t *)&v17, 0xCu);

  }
  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackManager _multiviewInfoForPlayer:](self, "_multiviewInfoForPlayer:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C8AC98]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rate");
    v14 = v13;

    if (v14 == 0.0)
    {
      v15 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412546;
        v18 = v8;
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Player %@ paused due to %@", (uint8_t *)&v17, 0x16u);
      }
      v16 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C8ACA0]) ^ 1;
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v9, "setPausedDueToInterruption:", v16);
  }

}

- (void)_applicationDidEnterBackground:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Setting app background date to %@", (uint8_t *)&v7, 0xCu);
  }
  -[VUIPlaybackManager setDateAppWasBackgrounded:](self, "setDateAppWasBackgrounded:", v4);
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:", CFSTR("Application did enter background"));

}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v3;

  -[VUIPlaybackManager stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Application will enter foreground"));

}

- (void)_applicationWillResignActive:(id)a3
{
  id v3;

  -[VUIPlaybackManager stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Application will resign active"));

}

- (void)_accountDidChange:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0DC8730], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "user did sign out", v7, 2u);
    }
    -[VUIPlaybackManager dismissPlaybackAnimated:leaveGroupActivitySession:completion:](self, "dismissPlaybackAnimated:leaveGroupActivitySession:completion:", 1, 1, 0);
  }
}

- (void)_audioSessionRouteDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "session route did change %@", (uint8_t *)&v8, 0xCu);
  }
  if (-[VUIPlaybackManager _audioContainsHDMIRoute](self, "_audioContainsHDMIRoute"))
  {
    -[VUIPlaybackManager _currentlyPlayingMultiviewInfo](self, "_currentlyPlayingMultiviewInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "play");

  }
}

- (void)_markMainPlayerMediaItemPlayingPictureInPictureMetadataAsActive:(BOOL)a3 forAVPlayerViewController:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  -[VUIPlaybackManager mainAVPlayerViewController](self, "mainAVPlayerViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentMediaItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMediaItemMetadata:forProperty:", v9, CFSTR("VUIContentMetadataIsPlayingInPIP"));

    }
  }
}

- (void)_markMainPlayerMediaItemPostPlayActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMediaItemMetadata:forProperty:", v5, CFSTR("VUIContentMetadataIsPlayingInPostPlay"));

  }
}

- (void)_notifyAVPlayerViewControllerDisplaySize
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  CFDictionaryRef DictionaryRepresentation;
  void *v11;
  void *v12;
  id v13;
  CGSize v14;

  -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v13, "videoDisplaySize");
  v6 = v5;
  v7 = v4;
  if (v5 != *MEMORY[0x1E0C9D820] || v4 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v13, "videoDisplayScale");
    v14.height = round(v7) * v9;
    v14.width = round(v6) * v9;
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v14);
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", DictionaryRepresentation, VUIPlaybackManagerNotificationKeyDisplaySize[0]);
    -[VUIPlaybackManager activePlayer](self, "activePlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v11, VUIPlaybackManagerNotificationKeyPlayer[0]);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:userInfo:", VUIPlaybackManagerVideoDisplaySizeDidChange[0], self, v3);

  }
}

- (void)_setExtrasButtonVisible:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (a3)
  {
    -[VUIPlaybackManager extrasControlItem](self, "extrasControlItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0C8B408]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EXTRAS_BUTTON_TITLE"), 0, CFSTR("VideosExtras"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v5, "initWithTitle:type:", v7, 2);

      objc_initWeak(&location, self);
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __46__VUIPlaybackManager__setExtrasButtonVisible___block_invoke;
      v12 = &unk_1E9F99C98;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v8, "setAction:", &v9);
      -[VUIPlaybackManager setExtrasControlItem:](self, "setExtrasControlItem:", v8, v9, v10, v11, v12);
      -[VUIPlaybackManager _mainPlayerViewControllerSetupControlItems](self, "_mainPlayerViewControllerSetupControlItems");
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    -[VUIPlaybackManager setExtrasControlItem:](self, "setExtrasControlItem:", 0);
    -[VUIPlaybackManager _mainPlayerViewControllerSetupControlItems](self, "_mainPlayerViewControllerSetupControlItems");
  }
}

void __46__VUIPlaybackManager__setExtrasButtonVisible___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Extras button pressed"));

}

- (void)_mainPlayerViewControllerRemoveAllCustomControlItems
{
  -[VUIPlaybackManager setExtrasControlItem:](self, "setExtrasControlItem:", 0);
  -[VUIPlaybackManager setShareControlItem:](self, "setShareControlItem:", 0);
  -[VUIPlaybackManager setMultiViewControlItem:](self, "setMultiViewControlItem:", 0);
  -[VUIPlaybackManager _mainPlayerViewControllerSetupControlItems](self, "_mainPlayerViewControllerSetupControlItems");
}

- (void)_mainPlayerViewControllerSetupControlItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_opt_new();
  -[VUIPlaybackManager extrasControlItem](self, "extrasControlItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v7, "addObject:", v3);
  -[VUIPlaybackManager multiViewControlItem](self, "multiViewControlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v7, "addObject:", v4);
  -[VUIPlaybackManager shareControlItem](self, "shareControlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v7, "addObject:", v5);
  -[VUIPlaybackManager mainAVPlayerViewController](self, "mainAVPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCustomControlItems:", v7);

}

- (void)_setupFeaturesFromMainPlayersCurrentMediaItem
{
  void *v3;
  id v4;

  -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentMediaItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VUIPlaybackManager _downloadRatingImageIfAvailable:](self, "_downloadRatingImageIfAvailable:", v4);
    -[VUIPlaybackManager _downloadProductPlacementImageIfAvailable:](self, "_downloadProductPlacementImageIfAvailable:", v4);
    -[VUIPlaybackManager _setupBootstrapPostPlayFeatureMonitorForMediaItem:](self, "_setupBootstrapPostPlayFeatureMonitorForMediaItem:", v4);
    -[VUIPlaybackManager _addRollsInfoFeaturesFromMediaItem:](self, "_addRollsInfoFeaturesFromMediaItem:", v4);
    -[VUIPlaybackManager _addSkipTriggerFeaturesToMonitor:](self, "_addSkipTriggerFeaturesToMonitor:", v4);
  }

}

- (void)_downloadRatingImageIfAvailable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  VUIPlaybackManager *v26;
  id v27[2];
  id location;

  v4 = a3;
  objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 1;
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupActivitiesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSessionActive");

  if ((v10 & 1) != 0 || v7)
  {
    -[VUIPlaybackManager ratingImage](self, "ratingImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && !v11)
    {
      objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BE0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
      {
        v13 = objc_opt_new();
        objc_msgSend((id)v13, "setWidth:", 100);
        objc_msgSend((id)v13, "setHeight:", 100);
        objc_msgSend((id)v13, "setFormat:", CFSTR("png"));
        objc_msgSend((id)v13, "setImageURL:", v12);
        objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BB0]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
        {
          v15 = (void *)objc_opt_new();
          objc_msgSend(v15, "setWidth:", 100);
          objc_msgSend(v15, "setHeight:", 100);
          objc_msgSend(v15, "setFormat:", CFSTR("png"));
          objc_msgSend(v15, "setImageURL:", v14);
        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
        v13 = 0;
      }
      objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B40]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B38]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "floatValue");
      v19 = v18;
      if (_os_feature_enabled_impl() && objc_msgSend(v16, "length"))
      {
        v20 = objc_opt_new();
        objc_msgSend((id)v20, "setWidth:", 100);
        objc_msgSend((id)v20, "setHeight:", 100);
        objc_msgSend((id)v20, "setFormat:", CFSTR("png"));
        objc_msgSend((id)v20, "setImageURL:", v16);
      }
      else
      {
        v20 = 0;
      }
      if (v13 | v20)
      {
        v23 = v12;
        objc_initWeak(&location, self);
        -[VUIPlaybackManager logoImageDownloader](self, "logoImageDownloader");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __54__VUIPlaybackManager__downloadRatingImageIfAvailable___block_invoke;
        v24[3] = &unk_1E9F9D010;
        objc_copyWeak(v27, &location);
        v22 = v4;
        *(double *)&v27[1] = v19;
        v25 = v22;
        v26 = self;
        objc_msgSend(v21, "downloadImagesWithAdvisoryImageInfo:photoSensitivityImageInfo:highMotionWarningImageInfo:completion:", v13, v15, v20, v24);

        objc_destroyWeak(v27);
        objc_destroyWeak(&location);
        v12 = v23;
      }
      else
      {
        -[VUIPlaybackManager _addProductPlacementFeatureFromMediaItem:](self, "_addProductPlacementFeatureFromMediaItem:", v4);
      }

    }
  }
  else
  {
    -[VUIPlaybackManager _addProductPlacementFeatureFromMediaItem:](self, "_addProductPlacementFeatureFromMediaItem:", v4);
  }

}

void __54__VUIPlaybackManager__downloadRatingImageIfAvailable___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  id WeakRetained;

  v7 = (id *)(a1 + 48);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "setRatingImage:", v10);

  objc_msgSend(WeakRetained, "setPhotoSensitivityImage:", v9);
  objc_msgSend(WeakRetained, "setHighMotionWarningImage:", v8);

  if (v10)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 6.0;
LABEL_5:
    objc_msgSend(WeakRetained, "_addTVRatingFeatureFromMediaItem:duration:", v11, v12);
    goto LABEL_6;
  }
  if (v8)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(double *)(a1 + 56);
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "_downloadProductPlacementImageIfAvailable:", *(_QWORD *)(a1 + 32));

}

- (void)_downloadProductPlacementImageIfAvailable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  -[VUIPlaybackManager productPlacementImage](self, "productPlacementImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !v5)
  {
    objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BC8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageUrlStringFormat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setWidth:", 100);
      objc_msgSend(v8, "setHeight:", 100);
      objc_msgSend(v8, "setFormat:", CFSTR("png"));
      objc_initWeak(&location, self);
      -[VUIPlaybackManager logoImageDownloader](self, "logoImageDownloader");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __64__VUIPlaybackManager__downloadProductPlacementImageIfAvailable___block_invoke;
      v10[3] = &unk_1E9F9D038;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v9, "downloadImagesWithAdvisoryImageInfo:photoSensitivityImageInfo:highMotionWarningImageInfo:completion:", v8, 0, 0, v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);

    }
  }

}

void __64__VUIPlaybackManager__downloadProductPlacementImageIfAvailable___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
    objc_msgSend(WeakRetained, "setProductPlacementImage:", v4);

}

- (void)_addTVRatingFeatureFromMediaItem:(id)a3 duration:(double)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  VUINowPlayingTVAdvisoryFeature *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)objc_opt_new();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v24;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v24 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
            v14 = objc_alloc(MEMORY[0x1E0DB1980]);
            objc_msgSend(v13, "start", (_QWORD)v23);
            v16 = v15;
            objc_msgSend(v13, "start");
            v18 = v17;
            objc_msgSend(v13, "duration");
            v20 = (void *)objc_msgSend(v14, "initWithStartTime:endTime:", v16, v18 + v19);
            if (v20)
              objc_msgSend(v7, "addObject:", v20);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v10);
      }

    }
    else
    {
      v7 = 0;
    }
    v21 = -[VUINowPlayingTVAdvisoryFeature initWithType:startTime:duration:]([VUINowPlayingTVAdvisoryFeature alloc], "initWithType:startTime:duration:", 9, 0.0, a4);
    if (v21)
    {
      if (objc_msgSend(v7, "count"))
        -[VUINowPlayingTVAdvisoryFeature setAdvisoryDisabledTimeRanges:](v21, "setAdvisoryDisabledTimeRanges:", v7);
      -[VUINowPlayingTimeBoundFeature setAutoRemove:](v21, "setAutoRemove:", 1, (_QWORD)v23);
      -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addFeature:", v21);

    }
  }
}

- (void)_addProductPlacementFeatureFromMediaItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  VUINowPlayingTVAdvisoryFeature *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BC8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackManager productPlacementImage](self, "productPlacementImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else
    {
      objc_msgSend(v6, "localizedInfoString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (!v9)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)objc_opt_new();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v30 = v10;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            v18 = objc_alloc(MEMORY[0x1E0DB1980]);
            objc_msgSend(v17, "start");
            v20 = v19;
            objc_msgSend(v17, "start");
            v22 = v21;
            objc_msgSend(v17, "duration");
            v24 = (void *)objc_msgSend(v18, "initWithStartTime:endTime:", v20, v22 + v23);
            if (v24)
              objc_msgSend(v11, "addObject:", v24);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v14);
      }

      v10 = v30;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "duration", v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    v28 = -[VUINowPlayingTVAdvisoryFeature initWithType:startTime:duration:]([VUINowPlayingTVAdvisoryFeature alloc], "initWithType:startTime:duration:", 13, 0.0, v27);
    if (v28)
    {
      if (objc_msgSend(v11, "count"))
        -[VUINowPlayingTVAdvisoryFeature setAdvisoryDisabledTimeRanges:](v28, "setAdvisoryDisabledTimeRanges:", v11);
      -[VUINowPlayingTimeBoundFeature setUserInfo:](v28, "setUserInfo:", v6);
      -[VUINowPlayingTimeBoundFeature setAutoRemove:](v28, "setAutoRemove:", 1);
      -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addFeature:", v28);

    }
    goto LABEL_22;
  }
LABEL_23:

}

- (void)_addRollsInfoFeaturesFromMediaItem:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  VUINowPlayingTimeBoundFeature *v13;
  double v14;
  double v15;
  double v16;
  VUINowPlayingTimeBoundFeature *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "type", (_QWORD)v19);
          if ((unint64_t)(v11 - 1) <= 2)
          {
            v12 = v11 + 3;
            v13 = [VUINowPlayingTimeBoundFeature alloc];
            objc_msgSend(v10, "start");
            v15 = v14;
            objc_msgSend(v10, "duration");
            v17 = -[VUINowPlayingTimeBoundFeature initWithType:startTime:duration:](v13, "initWithType:startTime:duration:", v12, v15, v16);
            if (v17)
            {
              -[VUINowPlayingTimeBoundFeature setSkippable:](v17, "setSkippable:", objc_msgSend(v10, "isSkippable"));
              -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addFeature:", v17);

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

  }
}

- (void)_addSkipTriggerFeaturesToMonitor:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  VUINowPlayingTimeBoundFeature *v15;
  double v16;
  double v17;
  double v18;
  VUINowPlayingTimeBoundFeature *v19;
  VUINowPlayingTimeBoundFeature *v20;
  VUINowPlayingTimeBoundFeature *v21;
  VUINowPlayingTimeBoundFeature *v22;
  VUINowPlayingTimeBoundFeature *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = sLogObject_5;
  v7 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = v6;
      *(_DWORD *)buf = 134217984;
      v31 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Number of skip features found = %lu", buf, 0xCu);

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v14, "type", (_QWORD)v25) == 1)
          {
            v15 = [VUINowPlayingTimeBoundFeature alloc];
            objc_msgSend(v14, "start");
            v17 = v16;
            objc_msgSend(v14, "duration");
            v19 = -[VUINowPlayingTimeBoundFeature initWithType:startTime:duration:](v15, "initWithType:startTime:duration:", 7, v17, v18);
            v20 = v19;
            if (v19)
            {
              -[VUINowPlayingTimeBoundFeature setUserInfo:](v19, "setUserInfo:", v14);
              objc_msgSend(v14, "target");
              objc_msgSend(v14, "start");
              v21 = [VUINowPlayingTimeBoundFeature alloc];
              objc_msgSend(v14, "start");
              v22 = -[VUINowPlayingTimeBoundFeature initWithType:startTime:duration:](v21, "initWithType:startTime:duration:", 8);
              v23 = v22;
              if (v22)
              {
                -[VUINowPlayingTimeBoundFeature setUserInfo:](v22, "setUserInfo:", v20);
                -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "addFeature:", v23);

              }
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "No skip features found", buf, 2u);
  }

}

- (void)_addSkipIntroFeatureToMonitorIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  char *v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  double v28;
  void *v29;
  void *v30;
  double v31;
  id v32;
  void *v33;
  char *v34;
  id v35;
  id v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  double v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!-[VUIPlaybackManager transportBarVisible](self, "transportBarVisible"))
  {
    if (-[VUIPlaybackManager isPIPing](self, "isPIPing"))
    {
      v3 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Not adding skip intro feature to the monitor as player view controller is in PIP state", buf, 2u);
      }
      return;
    }
    -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeFeatureForType:", 7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "deactivateFeature:animated:", v5, 1);
    objc_msgSend(v4, "featuresForType:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
    {
LABEL_40:

      return;
    }
    objc_msgSend(v4, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "elapsedTime");
      v10 = v9;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v12)
      {
        v13 = v12;
        v40 = v8;
        v41 = v6;
        v42 = v5;
        v43 = v4;
        v14 = 0;
        v15 = *(_QWORD *)v45;
        v16 = (char *)&unk_1EDA77000;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v45 != v15)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "userInfo", v40, v41, v42, v43, (_QWORD)v44);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "userInfo");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "start");
            v21 = v20;
            objc_msgSend(v19, "target");
            v23 = v22;
            objc_msgSend(v19, "duration");
            v25 = v10 >= v21 && v10 < v23;
            v26 = v23 - v10;
            if (v25 && v26 > 5.0)
            {
              if (v26 <= v24)
                v28 = v23 - v10;
              else
                v28 = v24;
              v29 = (void *)objc_msgSend(objc_alloc((Class)(v16 + 2480)), "initWithType:startTime:duration:", 7, v10, v28);
              objc_msgSend(v29, "setAutoRemove:", 1);
              if (v29)
              {
                objc_msgSend(v29, "setUserInfo:", v19);
                if (v14)
                {
                  objc_msgSend(v14, "userInfo");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "start");
                  if (v31 < v21)
                  {
                    v32 = v29;
                    v33 = v14;
                    v34 = v16;
                    v35 = v32;

                    v36 = v35;
                    v16 = v34;
                    v14 = v36;
                  }

                }
                else
                {
                  v14 = v29;
                }
              }

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v13);

        v5 = v42;
        v4 = v43;
        v8 = v40;
        v6 = v41;
        if (!v14)
          goto LABEL_39;
        v37 = (void *)sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          v38 = v37;
          objc_msgSend(v14, "duration");
          *(_DWORD *)buf = 134218240;
          v49 = v10;
          v50 = 2048;
          v51 = v39;
          _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "Adding skipIntro feature to feature monitor with start time - %f and duration - %f", buf, 0x16u);

        }
        objc_msgSend(v43, "addFeature:", v14);
      }
      else
      {
        v14 = v11;
      }

    }
LABEL_39:

    goto LABEL_40;
  }
}

- (id)_deepLinkPlaybackURLForCurrentMediaItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  -[VUIPlaybackManager activePlayer](self, "activePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C38]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length") || !objc_msgSend(v7, "length"))
    goto LABEL_9;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DB1DC0]) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DB1DD0]) & 1) == 0)
  {
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DB1DD8]))
    {
      v8 = 4;
      goto LABEL_6;
    }
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v8 = 1;
LABEL_6:
  v9 = (void *)MEMORY[0x1E0DC8808];
  v10 = objc_alloc_init(MEMORY[0x1E0DC8800]);
  objc_msgSend(v9, "_watchListAppPunchoutURLWithPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:allowPlayAction:isPlaybackURL:", v10, v8, v4, v5, v6, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC8808], "_punchoutURLForDirectPlayback:ignoreExtras:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v12;
}

- (void)_startPlaybackFromBeginning
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackFromBeginningTimeOffset");
  v5 = v4;

  -[VUIPlaybackManager activePlayer](self, "activePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setElapsedTime:precise:", 1, v5);

  -[VUIPlaybackManager activePlayer](self, "activePlayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "play");

}

- (void)_pushMoreInfoControllerIfNeeded
{
  void *v2;
  id v3;

  -[VUIPlaybackManager moreInfoCanonicalViewController](self, "moreInfoCanonicalViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[VUIApplicationRouter currentNavigationController](VUIApplicationRouter, "currentNavigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pushViewController:animated:", v3, 1);

  }
}

- (void)_removeMoreInfoViewControllerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[VUIPlaybackManager moreInfoCanonicalViewController](self, "moreInfoCanonicalViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = v3;
    objc_msgSend(v3, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "indexOfObject:", v11);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      v8 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v8, "removeObjectAtIndex:", v7);
      v9 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v11, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setViewControllers:", v9);

      -[VUIPlaybackManager setMoreInfoCanonicalViewController:](self, "setMoreInfoCanonicalViewController:", 0);
    }

    v3 = v11;
  }

}

- (void)_setupInfoTab
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowPlayFromBeginningButtonForMediaInfo");

  if (v5)
  {
    +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playTitleForFromBeginningAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playImageForFromBeginningAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3428];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __35__VUIPlaybackManager__setupInfoTab__block_invoke;
    v22[3] = &unk_1E9F9D060;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v7, v9, 0, v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

    objc_destroyWeak(&v23);
  }
  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "shouldShowMoreInfoButton");

  if (v13)
  {
    +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "moreInfoTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0DC3428];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __35__VUIPlaybackManager__setupInfoTab__block_invoke_2;
    v20[3] = &unk_1E9F9D060;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v15, 0, 0, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

    objc_destroyWeak(&v21);
  }
  -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v18, "setInfoViewActions:", v19);

  objc_destroyWeak(&location);
}

void __35__VUIPlaybackManager__setupInfoTab__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_startPlaybackFromBeginning");
    +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reportPlayFromBeginningMetrics");

    WeakRetained = v3;
  }

}

void __35__VUIPlaybackManager__setupInfoTab__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = a2;
  v4 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIPlaybackManager::will show more info", v12, 2u);
  }
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "moreInfoViewControllerWithAppContext:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "setMoreInfoCanonicalViewController:", v10);
      objc_msgSend(WeakRetained, "startPictureInPicture");
      +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reportMoreInfoMetrics");

    }
  }

}

- (void)_addPlayerToTimedMetadataManager:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timedMetadataManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObserverForPlayer:", v5);
  }

}

- (void)_removePlayerFromTimedMetadataManager:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timedMetadataManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "removeObserverForPlayer:", v5);
  }

}

- (void)_setupBootstrapPostPlayFeatureMonitorForMediaItem:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  VUINowPlayingTimeBoundFeature *v22;
  NSObject *v23;
  int v24;
  VUINowPlayingTimeBoundFeature *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIPlaybackManager activePlayer](self, "activePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  v7 = v6;

  if (v7 != *MEMORY[0x1E0DB1998])
  {
    objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BC0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playbackUpNextConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB37E8];
    if (v8)
    {
      objc_msgSend(v8, "doubleValue");
      v13 = v12;
    }
    else
    {
      objc_msgSend(v10, "minTimeIntervalFromEndToDisplay");
      v13 = v7 - v14;
    }
    objc_msgSend(v10, "bootstrapInterval");
    objc_msgSend(v11, "numberWithDouble:", v13 - v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v8, "doubleValue");
      if (v17 >= 0.0)
      {
        -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v20 = v19;
        objc_msgSend(v18, "featuresForType:", 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (VUINowPlayingTimeBoundFeature *)objc_claimAutoreleasedReturnValue();

        if (v22)
          -[VUINowPlayingTimeBoundFeature setStartTime:](v22, "setStartTime:", v20);
        else
          v22 = -[VUINowPlayingTimeBoundFeature initWithType:startTime:duration:]([VUINowPlayingTimeBoundFeature alloc], "initWithType:startTime:duration:", 3, v20, INFINITY);
        -[VUINowPlayingTimeBoundFeature setAutoRemove:](v22, "setAutoRemove:", 1);
        v23 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138412290;
          v25 = v22;
          _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "setup post play bootstrap feature:<%@>", (uint8_t *)&v24, 0xCu);
        }
        objc_msgSend(v18, "addFeature:", v22);

      }
    }

  }
}

- (void)_addVideoDimmingViewForPostPlay
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  -[VUIPlaybackManager postPlayView](self, "postPlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOverlayView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "viewWithTag:", 88);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(v5, "safeAreaLayoutGuide");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "layoutFrame");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;

        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v9, v11, v13, v15);
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBackgroundColor:", v17);

        objc_msgSend(v16, "setAlpha:", 0.0);
        objc_msgSend(v16, "setAutoresizingMask:", 18);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapAwayFromPostPlayGesture_);
        objc_msgSend(v16, "setTag:", 88);
        objc_msgSend(v16, "addGestureRecognizer:", v18);
        objc_msgSend(v5, "insertSubview:belowSubview:", v16, v3);
        v19 = (void *)MEMORY[0x1E0DC3F10];
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __53__VUIPlaybackManager__addVideoDimmingViewForPostPlay__block_invoke;
        v20[3] = &unk_1E9F98DF0;
        v6 = v16;
        v21 = v6;
        objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 5242880, v20, 0, 0.5, 0.0);

      }
    }

  }
}

uint64_t __53__VUIPlaybackManager__addVideoDimmingViewForPostPlay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.699999988);
}

- (void)_removeVideoDimmingViewForPostPlay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOverlayView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "viewWithTag:", 88);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v9 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __56__VUIPlaybackManager__removeVideoDimmingViewForPostPlay__block_invoke;
      v12[3] = &unk_1E9F98DF0;
      v13 = v6;
      v10[0] = v9;
      v10[1] = 3221225472;
      v10[2] = __56__VUIPlaybackManager__removeVideoDimmingViewForPostPlay__block_invoke_2;
      v10[3] = &unk_1E9F9B4F8;
      v11 = v13;
      objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 5242880, v12, v10, 0.5, 0.0);

    }
  }
}

uint64_t __56__VUIPlaybackManager__removeVideoDimmingViewForPostPlay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __56__VUIPlaybackManager__removeVideoDimmingViewForPostPlay__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_handleTapAwayFromPostPlayGesture:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[VUIPlaybackManager stateMachine](self, "stateMachine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0C99D80]);
    v5 = (void *)objc_msgSend(v4, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAA0], CFSTR("PostPlaySlideOutAnimationKey"), 0);
    objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Post play cancelled"), 0, v5);

  }
}

- (void)_postPlayItemSelected:(id)a3
{
  id v3;

  -[VUIPlaybackManager stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Post play item selected"));

}

- (void)_dismissPostPlayWithSwipe:(id)a3
{
  id v3;
  void *v4;
  id v5;

  -[VUIPlaybackManager stateMachine](self, "stateMachine", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  v4 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], CFSTR("PostPlaySlideOutAnimationKey"), 0);
  objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Post play cancelled"), 0, v4);

}

- (void)_resetAutoPlayBingeWatchingQualifications
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackManager setInitialPlaybackStartDate:](self, "setInitialPlaybackStartDate:", v3);

  -[VUIPlaybackManager setAutoPlayedVideosCount:](self, "setAutoPlayedVideosCount:", 0);
}

- (void)multiPlayerDetailsViewControllerDidSelectLockupWithIdentifier:(id)a3 impressionsData:(id)a4 locationData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VUIPlaybackManager multiPlayerViewController](self, "multiPlayerViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordMetricsEventWithIdentifier:impressionsData:locationData:didAddPlayer:", v10, v9, v8, 1);

}

- (void)multiPlayerDetailsViewControllerDidDeselectLockupWithIdentifier:(id)a3 impressionsData:(id)a4 locationData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VUIPlaybackManager multiPlayerViewController](self, "multiPlayerViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordMetricsEventWithIdentifier:impressionsData:locationData:didAddPlayer:", v10, v9, v8, 0);

}

- (id)detailsViewControllerForMultiPlayerViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;

  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabsInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "multiviewTabInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "broadcastLocale");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E9FF3598;
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v5, "playsFromStart");
    objc_msgSend(v13, "createHUDViewControllerWithTabInfo:excludingCanonicals:isMultiview:locale:playsFromStart:", v8, MEMORY[0x1E0C9AA60], 1, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "hudContentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "conformsToProtocol:", &unk_1F03473D0);

    if (v17)
    {
      objc_msgSend(v15, "hudContentViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDetailDelegate:", self);
      -[VUIPlaybackManager setMultiPlayerDetailsViewController:](self, "setMultiPlayerDetailsViewController:", v18);

    }
    objc_msgSend(v15, "hudContentViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (double)detailsViewHeightForMultiPlayerViewController:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[VUIPlaybackManager multiPlayerDetailsViewController](self, "multiPlayerDetailsViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsHeight");
  if (v4 <= 0.0)
    v5 = 326.5;
  else
    v5 = v4 + 38.0;

  return v5;
}

- (void)multiPlayerViewController:(id)a3 didEnterFullscreenWithPlayerViewController:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v9 = CFSTR("PlayerViewControllerKey");
    v10[0] = a4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = a4;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("Multiview did enter fullscreen"), 0, v7);

}

- (void)multiPlayerViewController:(id)a3 didExitFullscreenWithPlayerViewController:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v9 = CFSTR("PlayerViewControllerKey");
    v10[0] = a4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = a4;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("Multiview did exit fullscreen"), 0, v7);

}

- (void)multiPlayerViewController:(id)a3 didDismissWithPlayerViewController:(id)a4 withReason:(unint64_t)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  objc_msgSend(v6, "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", v7, CFSTR("PlayerViewControllerKey"));

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("Dismiss multiview playback"), 0, v9);

}

- (void)multiPlayerViewController:(id)a3 detailsViewControllerWillAppear:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v6 = a4;
  v7 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Multi player view controller details view controller will appear %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    v13 = *MEMORY[0x1E0DB1A08];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v14), "player");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currentMediaItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "mediaItemMetadataForProperty:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "length"))
          objc_msgSend(v8, "addObject:", v17);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  if (v6)
  {
    v18 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v6, "updateWithSelectedPlaybackIdentifiers:reloadingData:", v18, 0);

    +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updatePrefetchedDataOnExistingHUDContentViewController:excludingCanonicals:", v6, MEMORY[0x1E0C9AA60]);

  }
}

- (void)multiPlayerViewController:(id)a3 detailsViewControllerDidAppear:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Multi player view controller details view controller did appear %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)multiPlayerViewController:(id)a3 detailsViewControllerWillDisappear:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Multi player view controller details view controller will disappear %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)multiPlayerViewController:(id)a3 detailsViewControllerDidDisappear:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Multi player view controller details view controller did disappear %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)multiPlayerViewController:(id)a3 didSelectPlayerViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("PlayerViewControllerKey");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Did select multiview player"), 0, v7);
}

- (void)multiPlayerViewController:(id)a3 didSwapPlayerViewControllerAtIndex:(int64_t)a4 withPlayerAtIndex:(int64_t)a5
{
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 >= 2)
  {
    -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exchangeObjectAtIndex:withObjectAtIndex:", a4, a5);

    if (objc_msgSend(v14, "distribution") == 1)
    {
      if (!a4)
        goto LABEL_8;
    }
    else
    {
      -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count") != 3)
      {
LABEL_9:

        goto LABEL_10;
      }

      if (!a4)
      {
LABEL_8:
        -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "playerViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlaybackManager _muteAllMultiviewPlayersExcept:](self, "_muteAllMultiviewPlayersExcept:", v13);

        goto LABEL_9;
      }
    }
    if (!a5)
      goto LABEL_8;
  }
LABEL_10:

}

- (void)multiPlayerViewController:(id)a3 didBeginDropWithMediaInfo:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v9;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Multi player view controller did begin drop with %@", (uint8_t *)&v14, 0xCu);
  }
  if (!-[VUIPlaybackManager _multiviewContainsMediaInfo:](self, "_multiviewContainsMediaInfo:", v9))
  {
    v11 = -[VUIPlaybackManager multiviewPlayerCount](self, "multiviewPlayerCount");
    if (v11 < -[VUIPlaybackManager maxMultiviewPlayerCount](self, "maxMultiviewPlayerCount"))
    {
      objc_msgSend(v8, "setProspectivePlayerVisible:atIndex:animated:completion:", 1, a5, 1, 0);
      -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMultiviewPlaybackInfo prospectivePlaybackInfo](VUIMultiviewPlaybackInfo, "prospectivePlaybackInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertObject:atIndex:", v13, a5);

      -[VUIPlaybackManager _updateMultiviewReportingMetrics](self, "_updateMultiviewReportingMetrics");
    }
  }

}

- (void)multiPlayerViewController:(id)a3 didEndDropWithMediaInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Multi player view controller did end drop with %@", (uint8_t *)&v15, 0xCu);
  }
  v9 = objc_msgSend(v6, "prospectivePlayerIndex");
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v9;
    -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 >= objc_msgSend(v11, "count"))
    {
LABEL_7:

      goto LABEL_8;
    }
    -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMultiviewPlaybackInfo prospectivePlaybackInfo](VUIMultiviewPlaybackInfo, "prospectivePlaybackInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
    {
      -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectAtIndex:", v10);
      goto LABEL_7;
    }
  }
LABEL_8:
  objc_msgSend(v6, "setProspectivePlayerVisible:animated:completion:", 0, 1, 0);

}

- (void)multiPlayerViewController:(id)a3 didDropWithMediaInfo:(id)a4 overPlayerAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  NSObject *v17;
  int64_t v18;
  void *v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__VUIPlaybackManager_multiPlayerViewController_didDropWithMediaInfo_overPlayerAtIndex___block_invoke;
  aBlock[3] = &unk_1E9F9C430;
  v10 = v8;
  v21 = v10;
  objc_copyWeak(&v22, &location);
  v11 = _Block_copy(aBlock);
  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMultiviewPlaybackInfo prospectivePlaybackInfo](VUIMultiviewPlaybackInfo, "prospectivePlaybackInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 == v14;

  if (v15)
  {
    -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectAtIndex:", a5);

  }
  v17 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v9;
    v26 = 2048;
    v27 = a5;
    _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Multi player view controller did drop with %@ - %ld", buf, 0x16u);
  }
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = -[VUIPlaybackManager multiviewPlayerCount](self, "multiviewPlayerCount");
    if (v18 == -[VUIPlaybackManager maxMultiviewPlayerCount](self, "maxMultiviewPlayerCount"))
    {
      objc_msgSend(v9, "tvpPlaylist");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager replacePlaylistInMultiviewAtIndex:withPlaylist:animated:](self, "replacePlaylistInMultiviewAtIndex:withPlaylist:animated:", a5, v19, 1);
LABEL_12:

      goto LABEL_13;
    }
  }
  if (!-[VUIPlaybackManager _multiviewContainsMediaInfo:](self, "_multiviewContainsMediaInfo:", v9))
  {
    objc_msgSend(v9, "tvpPlaylist");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5 == 0x7FFFFFFFFFFFFFFFLL)
      -[VUIPlaybackManager addPlaylistToMultiview:animated:completion:](self, "addPlaylistToMultiview:animated:completion:", v19, 1, v11);
    else
      -[VUIPlaybackManager addPlaylistToMultiview:atIndex:animated:completion:](self, "addPlaylistToMultiview:atIndex:animated:completion:", v19, a5, 1, v11);
    goto LABEL_12;
  }
LABEL_13:

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __87__VUIPlaybackManager_multiPlayerViewController_didDropWithMediaInfo_overPlayerAtIndex___block_invoke(id *a1)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  v1 = a1;
  objc_msgSend(a1[4], "setProspectivePlayerVisible:animated:completion:", 0, 1, 0);
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "multiPlayerDetailsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "multiviewIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v2, "updateVisibleCellsWithPlaybackIdentifiers:", v5);

}

- (void)multiPlayerViewController:(id)a3 didRemovePlayer:(id)a4 atIndex:(int64_t)a5
{
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > a5)
  {
    -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", a5);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", a5);

    objc_msgSend(v13, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stop");

    objc_msgSend(v13, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    -[VUIPlaybackManager _unmuteNextAvailableMultiviewPlayer](self, "_unmuteNextAvailableMultiviewPlayer");
  }
}

- (void)multiPlayerViewController:(id)a3 didCrossSupportedScreenSizeBoundary:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "applicationState");

    if (v8 != 2)
    {
      -[VUIPlaybackManager _currentlyPlayingMultiviewInfo](self, "_currentlyPlayingMultiviewInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "playerViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_initWeak(&location, self);
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __84__VUIPlaybackManager_multiPlayerViewController_didCrossSupportedScreenSizeBoundary___block_invoke;
        v11[3] = &unk_1E9F9A938;
        objc_copyWeak(&v13, &location);
        v12 = v10;
        objc_msgSend(v6, "enterFullscreenWithPlayerViewController:completion:", v12, v11);

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }

    }
  }

}

void __84__VUIPlaybackManager_multiPlayerViewController_didCrossSupportedScreenSizeBoundary___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  id v5;
  id v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "isTrackingPlayerViewFrame");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v5, CFSTR("frame"), 0, __PlayerViewControllerFrameKVOContext);

    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "setTrackingPlayerViewFrame:", 1);

  }
}

- (void)multiPlayerViewController:(id)a3 didPinchPlayerToDismiss:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Showing multiview from a pinch", v7, 2u);
  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Show multiview playback"), 0, 0);

}

- (void)multiPlayerViewController:(id)a3 playerViewController:(id)a4 didResizeToFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  -[VUIPlaybackManager _multiviewInfoForPlayerViewController:](self, "_multiviewInfoForPlayerViewController:", a4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetWidth(v18));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReportingValueWithNumber:forKey:", v10, CFSTR("multiviewWidth"));

  objc_msgSend(v17, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetHeight(v19));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setReportingValueWithNumber:forKey:", v12, CFSTR("multiviewHeight"));

  objc_msgSend(v17, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMinX(v20));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setReportingValueWithNumber:forKey:", v14, CFSTR("multiviewOriginX"));

  objc_msgSend(v17, "player");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMinY(v21));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setReportingValueWithNumber:forKey:", v16, CFSTR("multiviewOriginY"));

}

- (id)_currentlyPlayingMultiviewInfo
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "context") == 1)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_unmuteNextAvailableMultiviewPlayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  -[VUIPlaybackManager _currentlyPlayingMultiviewInfo](self, "_currentlyPlayingMultiviewInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "player");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __57__VUIPlaybackManager__unmuteNextAvailableMultiviewPlayer__block_invoke;
        v7[3] = &unk_1E9F98DF0;
        v8 = v5;
        objc_msgSend(v8, "swapActiveAudioWithPlaybackInfo:completion:", 0, v7);

      }
    }

  }
}

void __57__VUIPlaybackManager__unmuteNextAvailableMultiviewPlayer__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setContext:", 1);
  objc_msgSend(*(id *)(a1 + 32), "playerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCanStartPictureInPictureAutomaticallyFromInline:", 1);

}

- (id)_multiviewInfoForPlayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "player");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_multiviewContainsMediaInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "tvpPlaylist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[VUIPlaybackManager multiviewContainsMediaItemWithIdentifier:](self, "multiviewContainsMediaItemWithIdentifier:", v6);
  return (char)self;
}

- (void)upNextButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[VUIPlaybackManager promoMetadataView](self, "promoMetadataView", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "skipInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "promoInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackManager activePlayer](self, "activePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentMediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIPlaybackManager upNextButtonImpressionMetrics](self, "upNextButtonImpressionMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsMediaEvent recordClickOfUpNextButtonWithPromoInfo:onMediaItem:impressionData:](VUIMetricsMediaEvent, "recordClickOfUpNextButtonWithPromoInfo:onMediaItem:impressionData:", v5, v7, v8);
  -[VUIPlaybackManager _recordUpNextButtonImpressionsWithPromoInfo:](self, "_recordUpNextButtonImpressionsWithPromoInfo:", v5);

}

- (void)autoPlayTimerDidCompleteForPostPlayView:(id)a3
{
  id v3;

  -[VUIPlaybackManager stateMachine](self, "stateMachine", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Post play auto play timer did complete"));

}

- (BOOL)allowedToAutoPlay
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  double v21;
  unint64_t v22;
  int v24;
  double v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackUpNextConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[VUIPlaybackManager _isNewPostPlayEnabled](self, "_isNewPostPlayEnabled")
    || (objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "postPlayAutoPlayNextVideo"),
        v5,
        v6))
  {
    -[VUIPlaybackManager initialPlaybackStartDate](self, "initialPlaybackStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager initialPlaybackStartDate](self, "initialPlaybackStartDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v9);
      v11 = v10;

      v12 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 134217984;
        v25 = v11;
        _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "current continuous playback time:(%f)", (uint8_t *)&v24, 0xCu);
      }
      v13 = (void *)sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        v15 = objc_msgSend(v4, "maximumAutoPlayableItems");
        v16 = -[VUIPlaybackManager autoPlayedVideosCount](self, "autoPlayedVideosCount");
        v24 = 134218240;
        v25 = *(double *)&v15;
        v26 = 2048;
        v27 = v16;
        _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "maximum auto playable items:(%lu) current count:(%lu)", (uint8_t *)&v24, 0x16u);

      }
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "groupActivitiesManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isSessionActive");

      if ((v19 & 1) != 0)
      {
        v20 = 0;
      }
      else
      {
        objc_msgSend(v4, "minAutoPlayStopTime");
        if (v11 >= v21)
        {
          v22 = -[VUIPlaybackManager autoPlayedVideosCount](self, "autoPlayedVideosCount");
          v20 = v22 < objc_msgSend(v4, "maximumAutoPlayableItems");
        }
        else
        {
          v20 = 1;
        }
      }

    }
    else
    {
      v20 = 1;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)playerViewController:(id)a3 targetViewForDismissalAnimationWithProposedTargetView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  CGRect v51;

  v6 = a3;
  v7 = a4;
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Showing video full screen with post play content on screen"));

  if (v10)
  {
    -[VUIPlaybackManager playbackContainerViewController](self, "playbackContainerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackManager _calculatePostPlayPipRectForParent:](self, "_calculatePostPlayPipRectForParent:", v11);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v51.origin.x = v13;
    v51.origin.y = v15;
    v51.size.width = v17;
    v51.size.height = v19;
    if (CGRectIsNull(v51))
      goto LABEL_10;
    goto LABEL_8;
  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "currentState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("Showing multiview playback")))
  {

LABEL_7:
    -[VUIPlaybackManager multiPlayerViewController](self, "multiPlayerViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "presentationRectForPlayerViewController:", v6);
    v13 = v26;
    v15 = v27;
    v17 = v28;
    v19 = v29;

LABEL_8:
    v30 = v7;
    v31 = v13;
    v32 = v15;
    v33 = v17;
    v34 = v19;
    goto LABEL_9;
  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "currentState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("Showing multiview playback in PIP"));

  if (v24)
    goto LABEL_7;
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "currentState");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("Transferring player to background media"));

  -[VUIPlaybackManager playbackContainerViewController](self, "playbackContainerViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  v43 = v42;
  v45 = v44;
  v47 = v46;
  if (v38)
  {
    v48 = v41;

    -[VUIPlaybackManager playbackContainerViewController](self, "playbackContainerViewController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "view");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v50, "setFrame:", v43, v48, v45, v47);
    v7 = v50;
    goto LABEL_10;
  }

  v30 = v7;
  v31 = v43;
  v32 = v47;
  v33 = v45;
  v34 = v47;
LABEL_9:
  objc_msgSend(v30, "setFrame:", v31, v32, v33, v34);
LABEL_10:

  return v7;
}

- (void)_updateTimeBoundFeature:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
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
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  dispatch_time_t v28;
  _QWORD block[5];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Updating UI with time bound feature - %@", buf, 0xCu);
  }
  switch(objc_msgSend(v6, "type"))
  {
    case 2:
      if (objc_msgSend(v6, "isActive"))
      {
        -[VUIPlaybackManager stateMachine](self, "stateMachine");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("Post play time boundary crossed");
        goto LABEL_22;
      }
      if (!-[VUIPlaybackManager _isNewPostPlayEnabled](self, "_isNewPostPlayEnabled"))
      {
        -[VUIPlaybackManager stateMachine](self, "stateMachine");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("Post play cancelled");
        goto LABEL_22;
      }
      goto LABEL_31;
    case 3:
      if (objc_msgSend(v6, "isActive"))
      {
        -[VUIPlaybackManager stateMachine](self, "stateMachine");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = CFSTR("Post play configuration time reached");
LABEL_22:
        objc_msgSend(v9, "postEvent:", v11);

      }
      goto LABEL_31;
    case 4:
    case 5:
    case 6:
      if (objc_msgSend(v6, "isActive"))
        v8 = objc_msgSend(v6, "isSkippable") ^ 1;
      else
        v8 = 0;
      -[VUIPlaybackManager setRequiresLinearPlayback:](self, "setRequiresLinearPlayback:", v8);
      -[VUIPlaybackManager _updateRequiresLinearPlayback](self, "_updateRequiresLinearPlayback");
      goto LABEL_31;
    case 7:
      if (!objc_msgSend(v6, "isActive"))
      {
        -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "activeFeatureForType:", 7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          -[VUIPlaybackManager _showSkipAndPromoView:animated:](self, "_showSkipAndPromoView:animated:", 0, v4);
        goto LABEL_27;
      }
      -[VUIPlaybackManager _showSkipAndPromoView:animated:](self, "_showSkipAndPromoView:animated:", 1, v4);
      goto LABEL_31;
    case 8:
      -[VUIPlaybackManager _addSkipIntroFeatureToMonitorIfNeeded](self, "_addSkipIntroFeatureToMonitorIfNeeded");
      goto LABEL_31;
    case 9:
      v12 = objc_msgSend(v6, "isActive");
      -[VUIPlaybackManager ratingImage](self, "ratingImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager photoSensitivityImage](self, "photoSensitivityImage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager highMotionWarningImage](self, "highMotionWarningImage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager _showTVRating:withRatingImage:photoSensitivityImage:highMotionWarningImage:animated:](self, "_showTVRating:withRatingImage:photoSensitivityImage:highMotionWarningImage:animated:", v12, v13, v14, v15, v4);

      if ((objc_msgSend(v6, "isActive") & 1) != 0)
        goto LABEL_31;
      -[VUIPlaybackManager currentMediaItem](self, "currentMediaItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BC8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[VUIPlaybackManager productPlacementImage](self, "productPlacementImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {

      }
      else
      {
        objc_msgSend(v17, "localizedInfoString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "length");

        if (!v27)
          goto LABEL_30;
      }
      v28 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__VUIPlaybackManager__updateTimeBoundFeature_animated___block_invoke;
      block[3] = &unk_1E9F98DF0;
      block[4] = self;
      dispatch_after(v28, MEMORY[0x1E0C80D38], block);
LABEL_30:

      goto LABEL_31;
    case 13:
      objc_msgSend(v6, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager productPlacementImage](self, "productPlacementImage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {

      }
      else
      {
        objc_msgSend(v19, "localizedInfoString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");

        if (!v23)
          goto LABEL_27;
      }
      v24 = objc_msgSend(v6, "isActive");
      -[VUIPlaybackManager productPlacementImage](self, "productPlacementImage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager _showProductPlacement:withImage:animated:](self, "_showProductPlacement:withImage:animated:", v24, v25, v4);

LABEL_27:
LABEL_31:

      return;
    default:
      goto LABEL_31;
  }
}

void __55__VUIPlaybackManager__updateTimeBoundFeature_animated___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "currentMediaItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_addProductPlacementFeatureFromMediaItem:", v2);

}

- (void)mediaInfoDidChangeTo:(id)a3 canPlay:(BOOL)a4 wasAutoPlayed:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v6 = a4;
  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v6 && !a5)
    -[VUIPlaybackManager _resetAutoPlayBingeWatchingQualifications](self, "_resetAutoPlayBingeWatchingQualifications");
  v22 = CFSTR("CanPlayMediaKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v8)
    objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("PlaylistKey"));
  -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("PlayerViewControllerKey"));

  }
  v14 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    VUIBoolLogString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v8;
    v20 = 2112;
    v21 = v16;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Now playing view controller media info changed:<%@>, canPlay:<%@>", (uint8_t *)&v18, 0x16u);

  }
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postEvent:withContext:userInfo:", CFSTR("Media info did change"), 0, v11);

}

- (void)_showShareMediaMenuForMediaItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Try to show share button for item: %@", (uint8_t *)&v9, 0xCu);
  }
  if (+[VUIMediaShareCoordinator shouldShowShareForMediaItem:](VUIMediaShareCoordinator, "shouldShowShareForMediaItem:", v4))
  {
    -[VUIPlaybackManager mainAVPlayerViewController](self, "mainAVPlayerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaShareControlButton shareControlItemForMediaItem:inPlayerViewController:](VUIMediaShareControlButton, "shareControlItemForMediaItem:inPlayerViewController:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIPlaybackManager setShareControlItem:](self, "setShareControlItem:", v7);
    -[VUIPlaybackManager _mainPlayerViewControllerSetupControlItems](self, "_mainPlayerViewControllerSetupControlItems");

  }
  else
  {
    v8 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "This item: %@ doesn't support share in player", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)_removeAdvisoryViews
{
  id v2;

  -[VUIPlaybackManager ratingView](self, "ratingView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllViews");

}

- (void)_showOrUpdateAdvisoryViewsIfNeeded
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  id v53;
  CGRect v54;

  -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "videoBounds");
  x = v54.origin.x;
  y = v54.origin.y;
  width = v54.size.width;
  height = v54.size.height;
  if (CGRectEqualToRect(v54, *MEMORY[0x1E0C9D648]))
    goto LABEL_22;
  if (-[VUIPlaybackManager shouldDisplayTVRatingWhenVideoBoundsIsAvailable](self, "shouldDisplayTVRatingWhenVideoBoundsIsAvailable"))
  {
    -[VUIPlaybackManager ratingImage](self, "ratingImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[VUIPlaybackManager photoSensitivityImage](self, "photoSensitivityImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager highMotionWarningImage](self, "highMotionWarningImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackManager _showTVRating:withRatingImage:photoSensitivityImage:highMotionWarningImage:animated:](self, "_showTVRating:withRatingImage:photoSensitivityImage:highMotionWarningImage:animated:", 1, v7, v8, v9, -[VUIPlaybackManager shouldAnimateTVRatingView](self, "shouldAnimateTVRatingView"));

      -[VUIPlaybackManager setShouldDisplayTVRatingWhenVideoBoundsIsAvailable:](self, "setShouldDisplayTVRatingWhenVideoBoundsIsAvailable:", 0);
      -[VUIPlaybackManager setShouldAnimateTVRatingView:](self, "setShouldAnimateTVRatingView:", 0);
    }
LABEL_16:

    goto LABEL_17;
  }
  -[VUIPlaybackManager ratingView](self, "ratingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[VUIPlaybackManager ratingView](self, "ratingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    objc_msgSend(v7, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "margin");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v7, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "userInterfaceIdiom");

    if (!v19 && (unint64_t)(objc_msgSend(MEMORY[0x1E0DC3F98], "vui_interfaceOrientation") - 1) < 2
      || +[VUIUtilities isIpadPortrait](VUIUtilities, "isIpadPortrait"))
    {
      objc_msgSend(v11, "portraitMargin");
      v13 = v20;
      v15 = v21;
      v17 = v22;
    }
    if (objc_msgSend(v7, "vuiIsRTL"))
    {
      objc_msgSend(v7, "sizeThatFits:", width, height);
      v24 = width - (v17 + v23);
    }
    else
    {
      v24 = x + v15;
    }
    v52 = y + v13;
    objc_msgSend(v7, "sizeThatFits:", width, height);
    objc_msgSend(v7, "setFrame:", v24, y + v13, v25, v26);
    objc_msgSend(v7, "photoSensitivityView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoSensitivityView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sizeThatFits:", width, height);
    v51 = v29;
    v31 = v30;

    objc_msgSend(v7, "sizeThatFits:", width, height);
    v33 = v32;
    objc_msgSend(v27, "sizeThatFits:", width, height);
    v35 = v34;
    v36 = objc_msgSend(v27, "vuiIsRTL");
    v37 = v35 - v33;
    if (!v36)
      v37 = 0.0;
    v38 = v24 - v37;
    objc_msgSend(v7, "photoSensitivityView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFrame:", v38, v52, v51, v31);

    goto LABEL_16;
  }
LABEL_17:
  if (-[VUIPlaybackManager shouldDisplayProductPlacementWhenVideoBoundsIsAvailable](self, "shouldDisplayProductPlacementWhenVideoBoundsIsAvailable")&& (-[VUIPlaybackManager ratingView](self, "ratingView"), v40 = (void *)objc_claimAutoreleasedReturnValue(), v40, !v40))
  {
    -[VUIPlaybackManager productPlacementImage](self, "productPlacementImage");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackManager _showProductPlacement:withImage:animated:](self, "_showProductPlacement:withImage:animated:", 1, v50, -[VUIPlaybackManager shouldAnimateProductPlacementView](self, "shouldAnimateProductPlacementView"));

    -[VUIPlaybackManager setShouldDisplayProductPlacementWhenVideoBoundsIsAvailable:](self, "setShouldDisplayProductPlacementWhenVideoBoundsIsAvailable:", 0);
    -[VUIPlaybackManager setShouldAnimateProductPlacementView:](self, "setShouldAnimateProductPlacementView:", 0);
  }
  else
  {
    -[VUIPlaybackManager productPlacementView](self, "productPlacementView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      -[VUIPlaybackManager productPlacementView](self, "productPlacementView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "layout");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "margin");
      v45 = x + v44;
      objc_msgSend(v43, "margin");
      v47 = y + v46;
      objc_msgSend(v42, "sizeThatFits:", width, height);
      objc_msgSend(v42, "setFrame:", v45, v47, v48, v49);

    }
  }
LABEL_22:

}

- (void)_showTVRating:(BOOL)a3 withRatingImage:(id)a4 photoSensitivityImage:(id)a5 highMotionWarningImage:(id)a6 animated:(BOOL)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  BOOL v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  _QWORD aBlock[4];
  id v35;
  id location[2];

  v10 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_initWeak(location, self);
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke;
  aBlock[3] = &unk_1E9F9D088;
  objc_copyWeak(&v35, location);
  v16 = _Block_copy(aBlock);
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_2;
  v27[3] = &unk_1E9F9D0B0;
  objc_copyWeak(&v32, location);
  v17 = v12;
  v28 = v17;
  v18 = v13;
  v29 = v18;
  v19 = v14;
  v30 = v19;
  v20 = v16;
  v31 = v20;
  v33 = a7;
  v21 = _Block_copy(v27);
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_5;
  v24[3] = &unk_1E9F9A758;
  objc_copyWeak(&v25, location);
  v26 = a7;
  v22 = _Block_copy(v24);
  v23 = v22;
  if (v10)
    v22 = v21;
  (*((void (**)(void))v22 + 2))();

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&v35);
  objc_destroyWeak(location);

}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15)
{
  id *v27;
  id v28;
  id WeakRetained;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  id v43;

  v43 = a2;
  v27 = (id *)(a1 + 32);
  v28 = a3;
  WeakRetained = objc_loadWeakRetained(v27);
  objc_msgSend(v43, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "userInterfaceIdiom");

  if ((v31 || (unint64_t)(objc_msgSend(MEMORY[0x1E0DC3F98], "vui_interfaceOrientation") - 1) >= 2)
    && !+[VUIUtilities isIpadPortrait](VUIUtilities, "isIpadPortrait"))
  {
    a8 = a4;
    a9 = a5;
    a11 = a7;
  }
  if (objc_msgSend(v43, "vuiIsRTL"))
  {
    objc_msgSend(v43, "sizeThatFits:", a14, a15);
    v33 = a14 - (a11 + v32);
  }
  else
  {
    v33 = a12 + a9;
  }
  v34 = a13 + a8;
  objc_msgSend(v43, "sizeThatFits:", a14, a15);
  v36 = v35;
  objc_msgSend(v43, "setFrame:", v33, v34, v37, v35);
  objc_msgSend(v28, "addSubview:", v43);

  objc_msgSend(v43, "layoutIfNeeded");
  objc_msgSend(v43, "center");
  v39 = v38;
  objc_msgSend(WeakRetained, "platterView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v39, v34 + -10.0, 0.0, v36 + 20.0);

  objc_msgSend(WeakRetained, "platterView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layoutIfNeeded");

}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
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
  void *v18;
  VUIVideoAdvisoryView *v19;
  VUIVideoAdvisoryView *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  VUIVideoAdvisoryView *v35;
  void *v36;
  void *v37;
  VUIAdditionalAdvisoryInfoView *v38;
  VUIAdditionalAdvisoryInfoView *v39;
  void *v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  VUIAdditionalAdvisoryInfoView *v54;
  void *v55;
  _QWORD v56[4];
  VUIAdditionalAdvisoryInfoView *v57;
  id v58;
  char v59;
  _QWORD block[4];
  VUIVideoAdvisoryView *v61;
  id v62;
  char v63;
  CGRect v64;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "activePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoBounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    objc_msgSend(WeakRetained, "avPlayerViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentOverlayView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v64.origin.x = v8;
    v64.origin.y = v10;
    v64.size.width = v12;
    v64.size.height = v14;
    if (CGRectEqualToRect(v64, *MEMORY[0x1E0C9D648]) || !v16)
    {
      objc_msgSend(WeakRetained, "setShouldDisplayTVRatingWhenVideoBoundsIsAvailable:", 1);
      objc_msgSend(WeakRetained, "setShouldAnimateTVRatingView:", *(unsigned __int8 *)(a1 + 72));
      goto LABEL_9;
    }
    +[VUIVideoAdvisoryInfoDictionaryBuilder advisoryInfoDictionaryWithRatingImage:photoSensitivityImage:highMotionWarningImage:andMediaItem:](VUIVideoAdvisoryInfoDictionaryBuilder, "advisoryInfoDictionaryWithRatingImage:photoSensitivityImage:highMotionWarningImage:andMediaItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (*(_QWORD *)(a1 + 32))
    {
      v19 = [VUIVideoAdvisoryView alloc];
      v20 = -[VUIVideoAdvisoryView initWithAdvisoryInfoDictionary:reduceMotion:](v19, "initWithAdvisoryInfoDictionary:reduceMotion:", v18, objc_msgSend(MEMORY[0x1E0DC6960], "isFeatureEnabled:", 1));
      -[VUIVideoAdvisoryView layout](v20, "layout");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 56);
      objc_msgSend(v21, "margin");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      objc_msgSend(v21, "portraitMargin");
      (*(void (**)(uint64_t, VUIVideoAdvisoryView *, void *, double, double, double, double, double, double, double, double, double, double, double, double))(v22 + 16))(v22, v20, v16, v24, v26, v28, v30, v31, v32, v33, v34, v8, v10, v12, v14);
      objc_msgSend(WeakRetained, "setRatingView:", v20);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_3;
      block[3] = &unk_1E9F9B698;
      objc_copyWeak(&v62, v2);
      v61 = v20;
      v63 = *(_BYTE *)(a1 + 72);
      v35 = v20;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v62);
    }
    else
    {
      if (!*(_QWORD *)(a1 + 48))
        goto LABEL_7;
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("VUIAdvisoryViewAdditionalViewsDictionaryKey"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v36;
      if (v36)
      {
        objc_msgSend(v36, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v21, "firstObject");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = [VUIAdditionalAdvisoryInfoView alloc];
          v39 = -[VUIAdditionalAdvisoryInfoView initWithAdvisoryInfoDictionary:reduceMotion:](v38, "initWithAdvisoryInfoDictionary:reduceMotion:", v55, objc_msgSend(MEMORY[0x1E0DC6960], "isFeatureEnabled:", 1));
          -[VUIAdditionalAdvisoryInfoView layout](v39, "layout");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = *(_QWORD *)(a1 + 56);
          objc_msgSend(v40, "margin");
          v43 = v42;
          v45 = v44;
          v47 = v46;
          v49 = v48;
          objc_msgSend(v40, "portraitMargin");
          (*(void (**)(uint64_t, VUIAdditionalAdvisoryInfoView *, void *, double, double, double, double, double, double, double, double, double, double, double, double))(v41 + 16))(v41, v39, v16, v43, v45, v47, v49, v50, v51, v52, v53, v8, v10, v12, v14);
          objc_msgSend(WeakRetained, "setHmwView:", v39);
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_4;
          v56[3] = &unk_1E9F9B698;
          objc_copyWeak(&v58, v2);
          v57 = v39;
          v59 = *(_BYTE *)(a1 + 72);
          v54 = v39;
          dispatch_async(MEMORY[0x1E0C80D38], v56);

          objc_destroyWeak(&v58);
        }
      }
    }

LABEL_7:
LABEL_9:

  }
}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(WeakRetained, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showAnimated:platterView:completion:", v3, v4, 0);

}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(WeakRetained, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showWithAnimatedLogoAndText:animateDivider:platterView:completion:", v3, 1, v4, 0);

}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "ratingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "hmwView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    v7 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(WeakRetained, "platterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_6;
    v15[3] = &unk_1E9F9A938;
    v9 = v15;
    v10 = &v17;
    objc_copyWeak(&v17, v2);
    v16 = v4;
    objc_msgSend(v16, "hideAnimated:platterView:completion:", v7, v8, v15);
LABEL_5:

    objc_destroyWeak(v10);
    goto LABEL_6;
  }
  if (v5)
  {
    v11 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(WeakRetained, "platterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_7;
    v12[3] = &unk_1E9F9A938;
    v9 = v12;
    v10 = &v14;
    objc_copyWeak(&v14, v2);
    v13 = v6;
    objc_msgSend(v13, "hideAnimated:platterView:hidePlatterView:completion:", v11, v8, 1, v12);
    goto LABEL_5;
  }
LABEL_6:

}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_6(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(WeakRetained, "setRatingView:", 0);
  objc_msgSend(WeakRetained, "platterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(WeakRetained, "setPlatterView:", 0);
}

void __106__VUIPlaybackManager__showTVRating_withRatingImage_photoSensitivityImage_highMotionWarningImage_animated___block_invoke_7(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(WeakRetained, "setHmwView:", 0);
  objc_msgSend(WeakRetained, "platterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(WeakRetained, "setPlatterView:", 0);
}

- (void)_showProductPlacement:(BOOL)a3 withImage:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  BOOL v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  BOOL v23;
  id location;

  v6 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke;
  aBlock[3] = &unk_1E9F9B698;
  objc_copyWeak(&v22, &location);
  v10 = v8;
  v21 = v10;
  v23 = a5;
  v11 = _Block_copy(aBlock);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_3;
  v17[3] = &unk_1E9F9A758;
  objc_copyWeak(&v18, &location);
  v19 = a5;
  v12 = _Block_copy(v17);
  v16 = v12;
  if (v6)
    v12 = v11;
  (*((void (**)(void *, uint64_t, uint64_t, uint64_t))v12 + 2))(v12, v13, v14, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  VUIProductPlacementView *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  VUIProductPlacementView *v25;
  _QWORD v26[4];
  VUIProductPlacementView *v27;
  char v28;
  CGRect v29;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "activePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "videoBounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(WeakRetained, "avPlayerViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentOverlayView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    if (CGRectEqualToRect(v29, *MEMORY[0x1E0C9D648]) || !v15)
    {
      objc_msgSend(WeakRetained, "setShouldDisplayProductPlacementWhenVideoBoundsIsAvailable:", 1);
      objc_msgSend(WeakRetained, "setShouldAnimateProductPlacementView:", *(unsigned __int8 *)(a1 + 48));
    }
    else
    {
      +[VUIVideoAdvisoryInfoDictionaryBuilder advisoryInfoDictionaryWithRatingImage:photoSensitivityImage:highMotionWarningImage:andMediaItem:](VUIVideoAdvisoryInfoDictionaryBuilder, "advisoryInfoDictionaryWithRatingImage:photoSensitivityImage:highMotionWarningImage:andMediaItem:", *(_QWORD *)(a1 + 32), 0, 0, v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[VUIProductPlacementView initWithAdvisoryInfoDictionary:]([VUIProductPlacementView alloc], "initWithAdvisoryInfoDictionary:", v16);
      -[VUIProductPlacementView layout](v17, "layout");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "margin");
      v20 = v7 + v19;
      objc_msgSend(v18, "margin");
      v22 = v9 + v21;
      -[VUIProductPlacementView sizeThatFits:](v17, "sizeThatFits:", v11, v13);
      -[VUIProductPlacementView setFrame:](v17, "setFrame:", v20, v22, v23, v24);
      objc_msgSend(v15, "addSubview:", v17);
      objc_msgSend(WeakRetained, "setProductPlacementView:", v17);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_2;
      v26[3] = &unk_1E9F9A5F8;
      v27 = v17;
      v28 = *(_BYTE *)(a1 + 48);
      v25 = v17;
      dispatch_async(MEMORY[0x1E0C80D38], v26);

    }
  }

}

uint64_t __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "show:animated:completion:", 1, *(unsigned __int8 *)(a1 + 40), 0);
}

void __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "productPlacementView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_4;
  v6[3] = &unk_1E9F98FD8;
  v7 = v3;
  v8 = WeakRetained;
  v5 = v3;
  objc_msgSend(v5, "show:animated:completion:", 0, v4, v6);

}

uint64_t __63__VUIPlaybackManager__showProductPlacement_withImage_animated___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "setProductPlacementView:", 0);
}

- (void)_showSkipAndPromoView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void (**v24)(_QWORD);
  void *v25;
  VUIPromoMetadataView *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  BOOL v32;
  double v33;
  double v34;
  VUIPromoMetadataView *v35;
  void (**v36)(_QWORD);
  void (**v37)(_QWORD);
  void *v38;
  _QWORD v39[4];
  void (**v40)(_QWORD);
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  VUIPromoMetadataView *v47;
  _QWORD v48[4];
  id v49;
  VUIPromoMetadataView *v50;
  id v51;
  _QWORD *v52;
  uint8_t *v53;
  id v54;
  BOOL v55;
  _QWORD v56[4];
  _QWORD v57[4];
  id v58;
  _QWORD aBlock[4];
  id v60;
  id location;
  uint8_t buf[8];
  uint8_t *v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  CGRect v67;
  CGRect v68;

  v4 = a4;
  v5 = a3;
  v66 = *MEMORY[0x1E0C80C00];
  v7 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v5;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Promo view show = %d", buf, 8u);
  }
  -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeFeatureForType:", 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke;
      aBlock[3] = &unk_1E9F99C98;
      objc_copyWeak(&v60, &location);
      v13 = (void (**)(_QWORD))_Block_copy(aBlock);
      -[VUIPlaybackManager promoMetadataView](self, "promoMetadataView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_15;
      -[VUIPlaybackManager promoMetadataView](self, "promoMetadataView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "superview");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (v17)
      {
LABEL_15:
        v26 = objc_alloc_init(VUIPromoMetadataView);
        -[VUIPromoMetadataView setDelegate:](v26, "setDelegate:", self);
        -[VUIPromoMetadataView setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[VUIPromoMetadataView updateWithInfo:](v26, "updateWithInfo:", v10);
        -[VUIPlaybackManager setPromoMetadataView:](self, "setPromoMetadataView:", v26);
        v27 = (void *)MEMORY[0x1E0DC3F98];
        objc_msgSend(v12, "bounds");
        v28 = objc_msgSend(v27, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v67));
        v29 = (void *)MEMORY[0x1E0DC3F98];
        objc_msgSend(v12, "bounds");
        v30 = objc_msgSend(v29, "vui_currentSizeClassForWindowWidth:", CGRectGetHeight(v68));
        *(_QWORD *)buf = 0;
        v63 = buf;
        v64 = 0x2020000000;
        v65 = 0.0;
        v56[0] = 0;
        v56[1] = v56;
        v56[2] = 0x2020000000;
        v32 = v28 != 5 && (v28 & 0xFFFFFFFFFFFFFFFDLL) != 4;
        if ((unint64_t)(v28 - 4) >= 3)
        {
          v34 = 34.0;
        }
        else
        {
          if ((unint64_t)(v30 - 3) >= 4)
            v33 = 90.0;
          else
            v33 = 80.0;
          v34 = 34.0;
          if ((unint64_t)(v30 - 3) < 4)
            v34 = 80.0;
          v65 = v33;
        }
        *(double *)&v56[3] = v34;
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_3;
        v48[3] = &unk_1E9F9D0D8;
        v49 = v12;
        v35 = v26;
        v55 = v32;
        v50 = v35;
        v52 = v56;
        objc_copyWeak(&v54, &location);
        v53 = buf;
        v51 = v10;
        v36 = (void (**)(_QWORD))_Block_copy(v48);
        v37 = v36;
        if (v4)
        {
          -[VUIPromoMetadataView setAlpha:](v35, "setAlpha:", 0.0);
          v37[2](v37);
          v13[2](v13);
          v38 = (void *)MEMORY[0x1E0DC3F10];
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_4;
          v46[3] = &unk_1E9F98DF0;
          v47 = v35;
          objc_msgSend(v38, "animateWithDuration:delay:options:animations:completion:", 5242880, v46, 0, 0.5, 0.0);

        }
        else
        {
          v36[2](v36);
          v13[2](v13);
        }

        objc_destroyWeak(&v54);
        _Block_object_dispose(v56, 8);
        _Block_object_dispose(buf, 8);

        objc_destroyWeak(&v60);
        objc_destroyWeak(&location);
      }
      else
      {
        -[VUIPlaybackManager promoMetadataView](self, "promoMetadataView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAlpha:", 0.0);
        objc_msgSend(v18, "updateWithInfo:", v10);
        if (v4)
        {
          v13[2](v13);
          v19 = (void *)MEMORY[0x1E0DC3F10];
          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_2;
          v57[3] = &unk_1E9F98DF0;
          v58 = v18;
          objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", 5242880, v57, 0, 0.5, 0.0);

        }
        else
        {
          objc_msgSend(v18, "setAlpha:", 1.0);
          v13[2](v13);
        }

        objc_destroyWeak(&v60);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    -[VUIPlaybackManager promoMetadataView](self, "promoMetadataView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "skipInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "promoInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackManager setPromoMetadataView:](self, "setPromoMetadataView:", 0);
    objc_initWeak((id *)buf, self);
    v23 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_5;
    v43[3] = &unk_1E9F9B6C0;
    v12 = v20;
    v44 = v12;
    objc_copyWeak(&v45, (id *)buf);
    v24 = (void (**)(_QWORD))_Block_copy(v43);
    -[VUIPlaybackManager _recordSkipButtonImpressionsWithSkipInfo:](self, "_recordSkipButtonImpressionsWithSkipInfo:", v10);
    if (v22)
      -[VUIPlaybackManager _recordUpNextButtonImpressionsWithPromoInfo:](self, "_recordUpNextButtonImpressionsWithPromoInfo:", v22);
    if (v4)
    {
      v25 = (void *)MEMORY[0x1E0DC3F10];
      v41[0] = v23;
      v41[1] = 3221225472;
      v41[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_6;
      v41[3] = &unk_1E9F98DF0;
      v42 = v12;
      v39[0] = v23;
      v39[1] = 3221225472;
      v39[2] = __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_7;
      v39[3] = &unk_1E9F98E18;
      v40 = v24;
      objc_msgSend(v25, "animateWithDuration:delay:options:animations:completion:", 5242880, v41, v39, 0.5, 0.0);

    }
    else
    {
      objc_msgSend(v12, "setAlpha:", 0.0);
      v24[2](v24);
    }

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);

  }
}

void __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "avPlayerViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setPlaybackControlsIncludeTransportControls:", 0);
  objc_msgSend(v3, "setPlaybackControlsIncludeVolumeControls:", 0);
  objc_msgSend(v3, "setPlaybackControlsIncludeDisplayModeControls:", 0);
  objc_msgSend(v3, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExcludedControls:", 32);
  objc_msgSend(v3, "setConfiguration:", v2);

}

uint64_t __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v2, "vui_sizeThatFits:", v3, v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", (v9 - v6) * 0.5, v10 - v8 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v6, v8);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v8 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v15 = 0.0;
    v16 = 0.0;
  }
  else
  {
    v17 = objc_msgSend(*(id *)(a1 + 40), "vuiIsRTL");
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
    v19 = v18;
    v21 = v20;
    objc_msgSend(*(id *)(a1 + 40), "setFrame:");
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v17)
    {
      v15 = v19 + v21;
      v14 = 0.0;
      v16 = 0.0;
    }
    else
    {
      v16 = v21 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v15 = 0.0;
      v14 = 0.0;
    }
  }
  objc_msgSend(v12, "setLegibleContentInsets:", 0.0, v15, v14, v16);

  v22 = (id *)(a1 + 72);
  v23 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v23, "_addTappableViewToRemoveSkipButton");

  +[VUIMetricsMediaEvent generateSkipImpressionsFromSkipInfo:](VUIMetricsMediaEvent, "generateSkipImpressionsFromSkipInfo:", *(_QWORD *)(a1 + 48));
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v24, "setSkipButtonImpressionMetrics:", v29);

  objc_msgSend(*(id *)(a1 + 48), "promoInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = objc_loadWeakRetained(v22);
    objc_msgSend(v26, "_recordPageMetricsForPreRoll:", v25);

    +[VUIMetricsMediaEvent generateUpNextButtonImpressionsFromPromoInfo:](VUIMetricsMediaEvent, "generateUpNextButtonImpressionsFromPromoInfo:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_loadWeakRetained(v22);
    objc_msgSend(v28, "setUpNextButtonImpressionMetrics:", v27);

  }
}

uint64_t __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_5(id *a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v1 = a1;
  objc_msgSend(a1[4], "removeFromSuperview");
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "_removeTappableViewForSkipButtonIfNeeded");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "avPlayerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLegibleContentInsets:", 0.0, 0.0, 0.0, 0.0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "avPlayerViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "avPlayerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaybackControlsIncludeTransportControls:", 1);

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "avPlayerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPlaybackControlsIncludeVolumeControls:", 1);

  v10 = objc_loadWeakRetained(v1);
  objc_msgSend(v10, "avPlayerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlaybackControlsIncludeDisplayModeControls:", 1);

  objc_msgSend(v13, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExcludedControls:", 0);
  objc_msgSend(v13, "setConfiguration:", v12);

}

uint64_t __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __53__VUIPlaybackManager__showSkipAndPromoView_animated___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_showSkipButtonWithTitle:(id)a3 show:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void (**v19)(_QWORD);
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
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  double v34;
  BOOL v35;
  double v36;
  BOOL v37;
  double v38;
  id v39;
  void (**v40)(_QWORD);
  void (**v41)(_QWORD);
  void *v42;
  _QWORD v43[4];
  void (**v44)(_QWORD);
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  VUIPlaybackManager *v55;
  id v56[3];
  BOOL v57;
  _QWORD v58[4];
  id v59;
  _QWORD aBlock[4];
  id v61;
  id location[2];
  CGRect v63;
  CGRect v64;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (!v6)
  {
    -[VUIPlaybackManager skipButton](self, "skipButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPlaybackManager setSkipButton:](self, "setSkipButton:", 0);
    -[VUIPlaybackManager setSkipCenterXConstraint:](self, "setSkipCenterXConstraint:", 0);
    -[VUIPlaybackManager setSkipBottomConstraint:](self, "setSkipBottomConstraint:", 0);
    -[VUIPlaybackManager setSkipTrailingConstraint:](self, "setSkipTrailingConstraint:", 0);
    objc_initWeak(location, self);
    v18 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_5;
    v47[3] = &unk_1E9F9B6C0;
    v10 = v17;
    v48 = v10;
    objc_copyWeak(&v49, location);
    v19 = (void (**)(_QWORD))_Block_copy(v47);
    -[VUIPlaybackManager _recordSkipButtonImpressionsWithSkipInfo:](self, "_recordSkipButtonImpressionsWithSkipInfo:", 0);
    if (v5)
    {
      v20 = (void *)MEMORY[0x1E0DC3F10];
      v45[0] = v18;
      v45[1] = 3221225472;
      v45[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_6;
      v45[3] = &unk_1E9F98DF0;
      v46 = v10;
      v43[0] = v18;
      v43[1] = 3221225472;
      v43[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_7;
      v43[3] = &unk_1E9F98E18;
      v44 = v19;
      objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", 5242880, v45, v43, 0.5, 0.0);

    }
    else
    {
      v19[2](v19);
    }

    objc_destroyWeak(&v49);
LABEL_27:
    objc_destroyWeak(location);
    goto LABEL_28;
  }
  -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_initWeak(location, self);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke;
    aBlock[3] = &unk_1E9F99C98;
    objc_copyWeak(&v61, location);
    v12 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[VUIPlaybackManager skipButton](self, "skipButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[VUIPlaybackManager skipButton](self, "skipButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTitle:forState:", v8, 0);
      objc_msgSend(v14, "alpha");
      if (v15 < 1.0)
      {
        if (v5)
        {
          objc_msgSend(v14, "setAlpha:", 0.0);
          v12[2](v12);
          v16 = (void *)MEMORY[0x1E0DC3F10];
          v58[0] = v11;
          v58[1] = 3221225472;
          v58[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_2;
          v58[3] = &unk_1E9F98DF0;
          v59 = v14;
          objc_msgSend(v16, "animateWithDuration:delay:options:animations:completion:", 5242880, v58, 0, 0.5, 0.0);

        }
        else
        {
          objc_msgSend(v14, "setAlpha:", 1.0);
          v12[2](v12);
        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTitle:forState:", v8, 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setBackgroundColor:", v22);

      objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTitleColor:forState:", v23, 0);

      objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTitleColor:forState:", v24, 5);

      objc_msgSend(v21, "titleLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTextAlignment:", 1);

      objc_msgSend(v21, "setContentEdgeInsets:", 14.0, 50.0, 14.0, 50.0);
      objc_msgSend(v21, "titleLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFont:", v27);

      objc_msgSend(v21, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setCornerRadius:", 12.0);

      objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel__skipButtonTapped_, 64);
      -[VUIPlaybackManager setSkipButton:](self, "setSkipButton:", v21);
      v29 = (void *)MEMORY[0x1E0DC3F98];
      objc_msgSend(v10, "bounds");
      v30 = objc_msgSend(v29, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v63));
      v31 = (void *)MEMORY[0x1E0DC3F98];
      objc_msgSend(v10, "bounds");
      v32 = objc_msgSend(v31, "vui_currentSizeClassForWindowWidth:", CGRectGetHeight(v64));
      v33 = v30 - 3;
      v34 = 90.0;
      if ((unint64_t)(v32 - 3) >= 4)
      {
        v35 = 1;
      }
      else
      {
        v34 = 80.0;
        v35 = v33 >= 4;
      }
      if (v35)
        v36 = 34.0;
      else
        v36 = 80.0;
      v37 = v33 > 3;
      if (v33 >= 4)
        v38 = 0.0;
      else
        v38 = v34;
      v52[0] = v11;
      v52[1] = 3221225472;
      v52[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_3;
      v52[3] = &unk_1E9F9D100;
      v53 = v10;
      v39 = v21;
      v54 = v39;
      objc_copyWeak(v56, location);
      v57 = v37;
      v56[1] = *(id *)&v38;
      v56[2] = *(id *)&v36;
      v55 = self;
      v40 = (void (**)(_QWORD))_Block_copy(v52);
      v41 = v40;
      if (v5)
      {
        objc_msgSend(v39, "setAlpha:", 0.0);
        v41[2](v41);
        v12[2](v12);
        v42 = (void *)MEMORY[0x1E0DC3F10];
        v50[0] = v11;
        v50[1] = 3221225472;
        v50[2] = __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_4;
        v50[3] = &unk_1E9F98DF0;
        v51 = v39;
        objc_msgSend(v42, "animateWithDuration:delay:options:animations:completion:", 5242880, v50, 0, 0.5, 0.0);

      }
      else
      {
        v40[2](v40);
        v12[2](v12);
      }

      objc_destroyWeak(v56);
    }

    objc_destroyWeak(&v61);
    goto LABEL_27;
  }
LABEL_28:

}

void __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "avPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaybackControlsIncludeTransportControls:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "avPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaybackControlsIncludeVolumeControls:", 0);

  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "avPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaybackControlsIncludeDisplayModeControls:", 0);

}

uint64_t __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setSkipCenterXConstraint:", v6);

  v7 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSkipBottomConstraint:", v10);

  v11 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSkipTrailingConstraint:", v14);

  LODWORD(v12) = *(unsigned __int8 *)(a1 + 80);
  v15 = objc_loadWeakRetained((id *)(a1 + 56));
  v16 = v15;
  if ((_DWORD)v12)
  {
    objc_msgSend(v15, "skipCenterXConstraint");
  }
  else
  {
    objc_msgSend(v15, "skipTrailingConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConstant:", -*(double *)(a1 + 64));

    v16 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v16, "skipTrailingConstraint");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  v19 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v19, "skipBottomConstraint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setConstant:", -*(double *)(a1 + 72));

  v21 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v21, "skipBottomConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  v23 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v23, "_addTappableViewToRemoveSkipButton");

  objc_msgSend(*(id *)(a1 + 48), "featureMonitor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activeFeatureForType:", 7);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v29, "userInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v29, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMetricsMediaEvent generateSkipImpressionsFromSkipInfo:](VUIMetricsMediaEvent, "generateSkipImpressionsFromSkipInfo:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_loadWeakRetained(v2);
      objc_msgSend(v28, "setSkipButtonImpressionMetrics:", v27);

    }
  }

}

uint64_t __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_5(id *a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v1 = a1;
  objc_msgSend(a1[4], "removeFromSuperview");
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "_removeTappableViewForSkipButtonIfNeeded");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "avPlayerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaybackControlsIncludeTransportControls:", 1);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "avPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaybackControlsIncludeVolumeControls:", 1);

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "avPlayerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaybackControlsIncludeDisplayModeControls:", 1);

}

uint64_t __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __61__VUIPlaybackManager__showSkipButtonWithTitle_show_animated___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_recordSkipButtonImpressionsWithSkipInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[VUIPlaybackManager skipButtonImpressionMetrics](self, "skipButtonImpressionMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VUIPlaybackManager activePlayer](self, "activePlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentMediaItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIMetricsMediaEvent recordImpressionsOfSkipButton:onMediaItem:skipInfo:](VUIMetricsMediaEvent, "recordImpressionsOfSkipButton:onMediaItem:skipInfo:", v4, v6, v7);
    -[VUIPlaybackManager setSkipButtonImpressionMetrics:](self, "setSkipButtonImpressionMetrics:", 0);

  }
}

- (void)_recordUpNextButtonImpressionsWithPromoInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[VUIPlaybackManager upNextButtonImpressionMetrics](self, "upNextButtonImpressionMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VUIPlaybackManager activePlayer](self, "activePlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentMediaItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIMetricsMediaEvent recordImpressionsOfUpNextButton:onMediaItem:promoInfo:](VUIMetricsMediaEvent, "recordImpressionsOfUpNextButton:onMediaItem:promoInfo:", v4, v6, v7);
    -[VUIPlaybackManager setUpNextButtonImpressionMetrics:](self, "setUpNextButtonImpressionMetrics:", 0);

  }
}

- (void)_recordPageMetricsForPreRoll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "elapsedTime");
  v8 = v7;
  objc_msgSend(v6, "currentMediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1C18]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    v14 = &stru_1E9FF3598;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v16, "start");
        v18 = v17;
        objc_msgSend(v16, "start");
        v20 = v19;
        objc_msgSend(v16, "duration");
        v22 = v20 + v21;
        if (v8 >= v18 && v8 < v22)
        {
          objc_msgSend(v16, "adamID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringValue");
          v25 = objc_claimAutoreleasedReturnValue();

          v14 = (__CFString *)v25;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v12);
  }
  else
  {
    v14 = &stru_1E9FF3598;
  }
  v34[0] = CFSTR("pageContext");
  v34[1] = CFSTR("contentPlaying");
  v35[0] = CFSTR("preRoll");
  v35[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsPageEventData createWithPageId:andPageType:andEventData:](VUIMetricsPageEventData, "createWithPageId:andPageType:andEventData:", v27, CFSTR("PreRoll"), v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "recordPage:", v28);

}

- (void)_skipButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[VUIPlaybackManager featureMonitor](self, "featureMonitor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeFeatureForType:", 7);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v20;
  if (v20)
  {
    objc_msgSend(v20, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v20;
    if (v6)
    {
      objc_msgSend(v20, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "target");
      if (v8 > 0.0)
      {
        v9 = v8;
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        -[VUIPlaybackManager activePlayer](self, "activePlayer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", v11, VUIPlaybackManagerNotificationKeyPlayer[0]);

        objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", &unk_1EA0B9520, VUIPlaybackManagerSeekReasonKey[0]);
        objc_msgSend(v10, "vui_setObjectIfNotNil:forKey:", v7, VUIPlaybackManagerSeekInfoKey);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = VUIPlaybackManagerWillSkipIntroNotification[0];
        v14 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v12, "postNotificationName:object:userInfo:", v13, self, v14);

        -[VUIPlaybackManager activePlayer](self, "activePlayer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currentMediaItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[VUIPlaybackManager skipButtonImpressionMetrics](self, "skipButtonImpressionMetrics");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMetricsMediaEvent recordClickOfSkipInfo:onMediaItem:impressionData:](VUIMetricsMediaEvent, "recordClickOfSkipInfo:onMediaItem:impressionData:", v7, v16, v17);
        -[VUIPlaybackManager _recordSkipButtonImpressionsWithSkipInfo:](self, "_recordSkipButtonImpressionsWithSkipInfo:", v7);
        -[VUIPlaybackManager activePlayer](self, "activePlayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setElapsedTime:precise:", 1, v9);

        -[VUIPlaybackManager activePlayer](self, "activePlayer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "play");

        -[VUIPlaybackManager _resetAutoPlayBingeWatchingQualifications](self, "_resetAutoPlayBingeWatchingQualifications");
      }

      v5 = v20;
    }
  }

}

- (void)_updateRequiresLinearPlayback
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  _BOOL8 v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[VUIPlaybackManager mainAVPlayerViewController](self, "mainAVPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentMediaItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasTrait:", *MEMORY[0x1E0DB1D40]);

    v7 = objc_msgSend(v3, "requiresLinearPlayback");
    if (v6)
    {
      if ((v7 & 1) == 0)
      {
        v8 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Overriding requiresLinearPlayback to YES due to TVPMediaItemTraitDisableScrubbing", (uint8_t *)&v14, 2u);
        }
        v9 = 1;
LABEL_13:
        objc_msgSend(v3, "setRequiresLinearPlayback:", v9);
      }
    }
    else if (v7 != -[VUIPlaybackManager requiresLinearPlayback](self, "requiresLinearPlayback"))
    {
      v10 = (void *)sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = -[VUIPlaybackManager requiresLinearPlayback](self, "requiresLinearPlayback");
        v13 = CFSTR("NO");
        if (v12)
          v13 = CFSTR("YES");
        v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Setting requiresLinearPlayback to %@", (uint8_t *)&v14, 0xCu);

      }
      v9 = -[VUIPlaybackManager requiresLinearPlayback](self, "requiresLinearPlayback");
      goto LABEL_13;
    }
    -[VUIPlaybackManager _updateMultiviewButtonState](self, "_updateMultiviewButtonState");
  }

}

- (void)_updateMultiviewButtonState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;
  CGSize v55;
  CGSize v56;
  CGSize v57;

  v54 = *MEMORY[0x1E0C80C00];
  -[VUIPlaybackManager mainAVPlayerViewController](self, "mainAVPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabsInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "multiviewTabInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiviewConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEnabled");

  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v3, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;
  v16 = (void *)sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v55.width = v13;
    v55.height = v15;
    NSStringFromCGSize(v55);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    VUIBoolLogString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v51 = v18;
    v52 = 2112;
    v53 = v19;
    _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Updating multiview button for size: %@, isEnabled: %@", buf, 0x16u);

  }
  if (v9)
  {
    -[VUIPlaybackManager multiPlayerViewController](self, "multiPlayerViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "documentCreator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "createMultiPlayerViewControllerWithPlayerViewControllers:showingDetails:", MEMORY[0x1E0C9AA60], 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setDelegate:", self);
    }
    v23 = objc_msgSend(v20, "isSupportedScreenSize:", v13, v15);
    v24 = (void *)sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v56.width = v13;
      v56.height = v15;
      NSStringFromCGSize(v56);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      VUIBoolLogString();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v26;
      v52 = 2112;
      v53 = v27;
      _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "Updating multiview button for size: %@, isSupported: %@", buf, 0x16u);

    }
    if (v23)
    {
      -[VUIPlaybackManager multiViewControlItem](self, "multiViewControlItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28 == 0;

      if (v29)
      {
        objc_initWeak((id *)buf, self);
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.split.2x2"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 22.0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "imageWithConfiguration:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = objc_alloc(MEMORY[0x1E0C8B408]);
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:", CFSTR("TV.Button.WatchInMultiview"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v33, "initWithTitle:type:", v35, 0);

        objc_msgSend(v36, "setImage:", v32);
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setTintColor:", v37);

        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __49__VUIPlaybackManager__updateMultiviewButtonState__block_invoke;
        v48[3] = &unk_1E9F99C98;
        objc_copyWeak(&v49, (id *)buf);
        objc_msgSend(v36, "setAction:", v48);
        -[VUIPlaybackManager setMultiViewControlItem:](self, "setMultiViewControlItem:", v36);
        objc_destroyWeak(&v49);

        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v45 = (void *)sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        v46 = v45;
        v57.width = v13;
        v57.height = v15;
        NSStringFromCGSize(v57);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v51 = v47;
        _os_log_impl(&dword_1D96EE000, v46, OS_LOG_TYPE_DEFAULT, "Removing multiview button => window size %@", buf, 0xCu);

      }
      -[VUIPlaybackManager setMultiViewControlItem:](self, "setMultiViewControlItem:", 0);
    }
    -[VUIPlaybackManager _mainPlayerViewControllerSetupControlItems](self, "_mainPlayerViewControllerSetupControlItems");

  }
  else
  {
    v38 = (void *)sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v38;
      +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "tabsInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "multiviewTabInfo");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      VUIBoolLogString();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC69D0], "isPad");
      VUIBoolLogString();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v43;
      v52 = 2112;
      v53 = v44;
      _os_log_impl(&dword_1D96EE000, v39, OS_LOG_TYPE_DEFAULT, "Not adding multiview because it is not enabled => remote flag: %@, is iPad: %@", buf, 0x16u);

    }
    -[VUIPlaybackManager setMultiViewControlItem:](self, "setMultiViewControlItem:", 0);
    -[VUIPlaybackManager _mainPlayerViewControllerSetupControlItems](self, "_mainPlayerViewControllerSetupControlItems");
  }

}

void __49__VUIPlaybackManager__updateMultiviewButtonState__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:withContext:userInfo:", CFSTR("Show multiview playback"), 0, 0);

}

- (BOOL)_shouldShowTimedMetadataDebugger
{
  void *v2;
  char v3;
  void *v4;

  if (!_os_feature_enabled_impl())
    return 0;
  objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "capellaDebuggerEnabled") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "capellaMusicInfoEnabled");

  }
  return v3;
}

- (BOOL)_shouldShowPerformanceDebugger
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "performanceDebuggerEnabled") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "performanceDebuggerVerboseEnabled");

  }
  return v3;
}

- (void)_addTimedMetadataDebuggerView
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
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUITimedMetadataDebuggerViewController view](self->_timedMetadataDebuggerViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", v5);
  v14 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v5, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v17;
  objc_msgSend(v5, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  objc_msgSend(v5, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v9;
  objc_msgSend(v5, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v13);

}

- (void)_addPerformanceDebuggerView
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
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIPlaybackManager performanceDebuggerViewController](self, "performanceDebuggerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", v6);
  self->_hasPerformanceDebuggerAppeared = 0;
  v15 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v6, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(v6, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  objc_msgSend(v6, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(v6, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

}

- (void)_setupPerformanceDebugger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  -[VUIPlaybackManager performanceDebuggerViewController](self, "performanceDebuggerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startupEventsDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setupWithPlaybackEventsDictionary:", v6);
  objc_msgSend(MEMORY[0x1E0DC69C0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "performanceDebuggerVerboseEnabled");

  v8 = 5.0;
  if ((_DWORD)v5)
    v8 = 30.0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__VUIPlaybackManager__setupPerformanceDebugger___block_invoke;
  v10[3] = &unk_1E9F9D128;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackManager setClearPerformanceDebuggerTimer:](self, "setClearPerformanceDebuggerTimer:", v9);

}

void __48__VUIPlaybackManager__setupPerformanceDebugger___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "performanceDebuggerViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clear");

}

- (void)_addTappableViewToRemoveSkipButton
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  uint64_t v22;

  -[VUIPlaybackManager skipButton](self, "skipButton");
  v22 = objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackManager promoMetadataView](self, "promoMetadataView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v22 | v3)
  {
    -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v5, "bounds");
      v7 = (void *)objc_msgSend(v6, "initWithFrame:");
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleDismissSkipButtonGesture_);
      objc_msgSend(v7, "setTag:", 76);
      objc_msgSend(v7, "addGestureRecognizer:", v8);
      if (v22)
        v9 = v22;
      else
        v9 = v3;
      objc_msgSend(v5, "insertSubview:belowSubview:", v7, v9);
      objc_msgSend(v7, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setActive:", 1);

      objc_msgSend(v7, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setActive:", 1);

      objc_msgSend(v7, "rightAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rightAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActive:", 1);

      objc_msgSend(v7, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setActive:", 1);

    }
  }

}

- (void)_removeTappableViewForSkipButtonIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v3, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "tag") == 76)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v5, "removeFromSuperview");
}

- (void)_handleDismissSkipButtonGesture:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "state") == 3)
  {
    -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featuresForType:", 7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          -[VUIPlaybackManager featureMonitor](self, "featureMonitor", (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "deactivateFeature:animated:", v11, 1);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[VUIPlaybackManager _resetAutoPlayBingeWatchingQualifications](self, "_resetAutoPlayBingeWatchingQualifications");
  }
}

- (void)_configureStillWatchingFeatureMonitoringIfLivePlayback
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  VUINowPlayingTimerTriggeredFeature *v8;
  void *v9;
  id v10;

  -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  v5 = v4;

  if (v5 == *MEMORY[0x1E0DB1990])
  {
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nowPlayingConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "showsStillWatchingAlert"))
    {
      objc_msgSend(v10, "stillWatchingAlertDuration");
      if (v7 > 0.0)
      {
        v8 = -[VUINowPlayingTimerTriggeredFeature initWithType:duration:repeats:]([VUINowPlayingTimerTriggeredFeature alloc], "initWithType:duration:repeats:", 10, 1, v7);
        -[VUIPlaybackManager featureMonitor](self, "featureMonitor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addFeature:", v8);

      }
    }

  }
}

- (void)_updateTimeTriggeredFeature:(id)a3 animated:(BOOL)a4
{
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "type") == 10)
    -[VUIPlaybackManager _showStillWatchingAlertFeature:](self, "_showStillWatchingAlertFeature:", v5);

}

- (void)_showStillWatchingAlertFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isActive"))
  {
    objc_initWeak(&location, self);
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nowPlayingConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertIdleTimeout");
    v9 = v8;

    -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentMediaItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vui_viewControllerForFullScreenPresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__VUIPlaybackManager__showStillWatchingAlertFeature___block_invoke;
    v15[3] = &unk_1E9F9D150;
    objc_copyWeak(&v17, &location);
    v16 = v5;
    +[VUIStillWatchingAlertPresenter presentWithTitle:presentingController:timeout:responseHandler:](VUIStillWatchingAlertPresenter, "presentWithTitle:presentingController:timeout:responseHandler:", v12, v14, v15, v9);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

uint64_t __53__VUIPlaybackManager__showStillWatchingAlertFeature___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if ((unint64_t)(a2 - 1) <= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "dismissPlaybackAnimated:leaveGroupActivitySession:completion:", 1, 1, 0);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
}

- (void)_performEnterBackgroundOperations
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[VUIPlaybackManager pausedTooLongTimer](self, "pausedTooLongTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating paused too long timer because app was backgrounded. Will re-create timer when app is foregrounded", v17, 2u);
    }
    -[VUIPlaybackManager pausedTooLongTimer](self, "pausedTooLongTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[VUIPlaybackManager setPausedTooLongTimer:](self, "setPausedTooLongTimer:", 0);
  }
  if (-[VUIPlaybackManager isFullscreenPlaybackUIBeingShown](self, "isFullscreenPlaybackUIBeingShown"))
  {
    -[VUIPlaybackManager activePlayer](self, "activePlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "externalPlaybackType");

    if (v7)
    {
      v8 = sLogObject_5;
      v9 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
      v10 = 0;
      if (v9)
      {
        *(_DWORD *)v17 = 134217984;
        *(_QWORD *)&v17[4] = 0x404E000000000000;
        v11 = "Will NOT restart playback if backgrounded for more than %f seconds because external playback is active";
        goto LABEL_11;
      }
    }
    else
    {
      -[VUIPlaybackManager activePlayer](self, "activePlayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentMediaItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasTrait:", *MEMORY[0x1E0DB1D90]);

      v8 = sLogObject_5;
      v16 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
      if (!v15)
      {
        if (!v16)
          goto LABEL_12;
        *(_DWORD *)v17 = 134217984;
        *(_QWORD *)&v17[4] = 0x404E000000000000;
        v11 = "Will NOT restart playback if backgrounded for more than %f seconds because media item does not require it";
LABEL_11:
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, v11, v17, 0xCu);
LABEL_12:
        v10 = 0;
        goto LABEL_13;
      }
      if (v16)
      {
        *(_DWORD *)v17 = 134217984;
        *(_QWORD *)&v17[4] = 0x404E000000000000;
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Will restart playback if backgrounded for more than %f seconds", v17, 0xCu);
      }
      v10 = 1;
    }
  }
  else
  {
    v8 = sLogObject_5;
    v12 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
    v10 = 0;
    if (v12)
    {
      *(_DWORD *)v17 = 134217984;
      *(_QWORD *)&v17[4] = 0x404E000000000000;
      v11 = "Will NOT restart playback if backgrounded for more than %f seconds because playback is not fullscreen";
      goto LABEL_11;
    }
  }
LABEL_13:
  -[VUIPlaybackManager setShouldRestartIfAppHasBeenBackgroundedTooLong:](self, "setShouldRestartIfAppHasBeenBackgroundedTooLong:", v10, *(_OWORD *)v17);
}

- (void)_performEnterForegroundOperations
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to determine whether to restart playback since dateAppWasBackgrounded is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_avPlayerViewControllerPresentationDidTimeout
{
  id v2;

  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("AVPlayerViewController presentation did timeout"));

}

- (void)_donateUserActivityForMediaItem:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3B10];
  v5 = a3;
  v10 = (id)objc_msgSend([v4 alloc], "initWithActivityType:", CFSTR("com.apple.UMC.externalMediaContent"));
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B58]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(v10, "setExternalMediaContentIdentifier:", v6);
    objc_msgSend(v10, "setWebpageURL:", v7);
    -[VUIPlaybackManager avPlayerViewController](self, "avPlayerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserActivity:", v10);

    objc_msgSend(v10, "becomeCurrent");
  }

}

- (CGRect)_calculatePostPlayPipRectForParent:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  int v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClass");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "orientation");

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = +[VUIUtilities isPortraitIgnoringFlatOrientation:viewSize:](VUIUtilities, "isPortraitIgnoringFlatOrientation:viewSize:", v7, v10, v12);
  if (objc_msgSend(MEMORY[0x1E0DC69D0], "isPhone"))
  {
    if (!v13)
    {
      v14 = 16.0;
LABEL_10:
      v17 = 47.0;
      goto LABEL_11;
    }
  }
  else
  {
    v15 = (unint64_t)(v5 - 1) < 3 || v13;
    if (v15 != 1)
    {
      v14 = 38.0;
      goto LABEL_10;
    }
  }
  objc_msgSend(v4, "safeAreaInsets");
  v14 = v16 + 60.0;
  v17 = 16.0;
LABEL_11:
  v18 = objc_msgSend(MEMORY[0x1E0DC69D0], "isPad");
  objc_msgSend(v4, "bounds");
  v20 = v19;
  -[VUIPlaybackManager mainPlayer](self, "mainPlayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "currentMediaItemPresentationSize");
  v23 = v22;
  v25 = v24;

  if (v23 == 0.0 || v25 == 0.0)
  {
    v28 = *MEMORY[0x1E0C9D628];
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    if (v18)
      v26 = 300.0;
    else
      v26 = 212.0;
    v27 = v26 / (v23 / v25);
    if (objc_msgSend(v4, "vuiIsRTL"))
      v28 = v17;
    else
      v28 = v20 - v26 - v17;
  }

  v29 = v28;
  v30 = v14;
  v31 = v26;
  v32 = v27;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (BOOL)_isNewPostPlayEnabled
{
  return 1;
}

- (void)_updateActivityItemsConfigurationWithSharedWatchId:(id)a3 sharedWatchUrl:(id)a4 previewMetadata:(id)a5 mediaItem:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  char v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B48]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (objc_msgSend(v14, "length"))
  {
    if (v17)
      goto LABEL_3;
LABEL_10:
    v38 = v10;
    objc_msgSend(v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B58]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v11;
    if (v20)
    {
      v21 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v20;
        _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "Adding launch playback URL %@", buf, 0xCu);
      }
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v20);
      if (!v12)
        goto LABEL_27;
    }
    else
    {
      v22 = 0;
      if (!v12)
        goto LABEL_27;
    }
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "groupActivitiesManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      if (v38 && v37)
      {
        v25 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v37;
          _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "Adding shared watch URL %@", buf, 0xCu);
        }
        +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "groupActivitiesManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "itemProviderForActivityWithSharedWatchId:sharedWatchUrl:previewMetadata:existingItemProvider:", v38, v37, v12, v22);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        v30 = (void *)v28;

        v22 = v30;
        goto LABEL_27;
      }
      if (v15)
      {
        v29 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v15;
          _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "Adding group activity with adam id %@", buf, 0xCu);
        }
        +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "groupActivitiesManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "itemProviderForActivityWithAdamId:previewMetadata:existingItemProvider:", v15, v12, v22);
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
    }
LABEL_27:
    if (v22)
    {
      v31 = objc_alloc(MEMORY[0x1E0DC3440]);
      v39 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v31, "initWithItemProviders:", v32);
      -[VUIPlaybackManager setItemsConfiguration:](self, "setItemsConfiguration:", v33);

      +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "appWindow");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "windowScene");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "setActivityItemsConfigurationSource:", self);
    }
    else
    {
      -[VUIPlaybackManager _clearActivityItemsConfiguration](self, "_clearActivityItemsConfiguration");
    }

    v11 = v37;
    v10 = v38;
    goto LABEL_31;
  }
  if (objc_msgSend(v15, "length"))
    v19 = v17;
  else
    v19 = 1;
  if ((v19 & 1) == 0)
    goto LABEL_10;
LABEL_3:
  v18 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "Not adding items because adam id and canonical id are missing or is adult content", buf, 2u);
  }
  -[VUIPlaybackManager _clearActivityItemsConfiguration](self, "_clearActivityItemsConfiguration");
LABEL_31:

}

- (void)_clearActivityItemsConfiguration
{
  void *v2;
  void *v3;
  id v4;

  -[VUIPlaybackManager setItemsConfiguration:](self, "setItemsConfiguration:", 0);
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setActivityItemsConfigurationSource:", 0);
}

- (id)_multiviewInfoForPlayerViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "playerViewController");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_muteAllMultiviewPlayersExcept:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  -[VUIPlaybackManager _multiviewInfoForPlayerViewController:](self, "_multiviewInfoForPlayerViewController:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlaybackManager _currentlyPlayingMultiviewInfo](self, "_currentlyPlayingMultiviewInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (v4 != v5)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __53__VUIPlaybackManager__muteAllMultiviewPlayersExcept___block_invoke;
        v7[3] = &unk_1E9F98FD8;
        v8 = v4;
        v9 = v5;
        objc_msgSend(v8, "swapActiveAudioWithPlaybackInfo:completion:", v9, v7);

      }
    }
  }

}

void __53__VUIPlaybackManager__muteAllMultiviewPlayersExcept___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setContext:", 1);
  objc_msgSend(*(id *)(a1 + 32), "playerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCanStartPictureInPictureAutomaticallyFromInline:", 1);

  objc_msgSend(*(id *)(a1 + 40), "setContext:", 0);
  objc_msgSend(*(id *)(a1 + 40), "playerViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCanStartPictureInPictureAutomaticallyFromInline:", 0);

}

- (void)_updateMultiviewReportingMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[VUIPlaybackManager stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Showing multiview playback")))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &unk_1EA0B9538;
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VUIPlaybackManager multiviewPlaybackInfo](self, "multiviewPlaybackInfo", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "player");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setReportingValueWithNumber:forKey:", v7, CFSTR("multiviewCount"));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_handlePausedTooLong:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[VUIPlaybackManager pausedTooLongTimer](self, "pausedTooLongTimer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[VUIPlaybackManager setPausedTooLongTimer:](self, "setPausedTooLongTimer:", 0);
  v5 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing playback since playback has been paused too long", v6, 2u);
  }
  -[VUIPlaybackManager dismissPlaybackAnimated:leaveGroupActivitySession:completion:](self, "dismissPlaybackAnimated:leaveGroupActivitySession:completion:", 1, 1, 0);
}

- (void)presentViewControllerOnExtrasNav:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0DC3A40];
  v5 = a3;
  v9 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  objc_msgSend(v9, "setModalPresentationStyle:", 0);
  -[VUIPlaybackManager backgroundAudioPlayer](self, "backgroundAudioPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stop");

  -[VUIPlaybackManager extrasContext](self, "extrasContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extrasRootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, 0);

}

- (id)extrasNavigationController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extrasContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extrasRootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v3;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "_createAndPresentExtrasAVPlayerViewController with presentingController:%@", buf, 0xCu);
  }
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "createPlayerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained(v5);
  objc_msgSend(v8, "setAvPlayerViewController:", v7);

  v9 = objc_loadWeakRetained(v5);
  objc_msgSend(v9, "setExtrasAVPlayerViewController:", v7);

  v10 = objc_loadWeakRetained(v5);
  v11 = objc_msgSend(v10, "_isNewPostPlayEnabled");

  if (v11)
    objc_msgSend(v7, "_setIgnoreAppSupportedOrientations:", 1);
  v12 = objc_loadWeakRetained(v5);
  objc_msgSend(v12, "stateMachine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_618;
  v16[3] = &unk_1E9F9D178;
  v14 = v3;
  v17 = v14;
  v15 = v7;
  v18 = v15;
  objc_copyWeak(&v19, v5);
  objc_msgSend(v13, "executeBlockAfterCurrentStateTransition:", v16);

  objc_destroyWeak(&v19);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_618(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2;
  block[3] = &unk_1E9F9D178;
  v3 = a1[4];
  v4 = a1[5];
  objc_copyWeak(&v5, a1 + 6);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v5);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3;
  v3[3] = &unk_1E9F99C98;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, 1, v3);
  objc_destroyWeak(&v4);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("AVPlayerViewController presentation did complete"));

}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  const char *v14;
  uint8_t *v15;
  NSObject *v16;
  uint64_t v17;
  __int16 v19;
  uint8_t v20[2];
  uint8_t v21[16];
  uint8_t buf[16];

  v3 = a2;
  objc_msgSend(v3, "javascriptURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = sLogObject_5;
  v6 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      v19 = 0;
      v14 = "Extras URL does not exist for this media item";
      v15 = (uint8_t *)&v19;
      v16 = v5;
LABEL_13:
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Extras URL exists for this media item", buf, 2u);
  }
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "networkStatus");

  if (v8 != 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "mainPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "allowsCellularUsage");

    if (!v11)
    {
      v17 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        v14 = "Not loading Extras since current network config and/or user settings do not allow it";
        v15 = v20;
        v16 = v17;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
  }
  v12 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Will load Extras since current network config and user settings allow it", v21, 2u);
  }
  objc_msgSend(v3, "setShowsMenuBar:", 0);
  objc_msgSend(v3, "setShowsBuiltInNavigationControls:", 1);
  v13 = v3;
LABEL_15:

  return v13;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_621(uint64_t a1, void *a2)
{
  id v3;
  VideosExtrasContext *v4;
  void *v5;

  v3 = a2;
  v4 = -[VideosExtrasContext initWithTVPMediaItem:]([VideosExtrasContext alloc], "initWithTVPMediaItem:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_624(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VUIStoreAuxMediaItem *v9;
  VideosExtrasContext *v10;
  void *v11;

  v3 = *MEMORY[0x1E0DB1AC8];
  v4 = a2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DB1A00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DB1CB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("HLSURLKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[VUIStoreAuxMediaItem initWithURL:]([VUIStoreAuxMediaItem alloc], "initWithURL:", v8);
  v10 = -[VideosExtrasContext initWithApplicationJavascriptURL:storeID:buyParameters:mediaItem:]([VideosExtrasContext alloc], "initWithApplicationJavascriptURL:storeID:buyParameters:mediaItem:", v5, objc_msgSend(v7, "longLongValue"), v6, v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_627(id *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a2;
  objc_msgSend(v3, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(v5, "addObserver:selector:name:object:", WeakRetained, sel__playbackStateDidChange_, *MEMORY[0x1E0DB1F58], v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained(a1);
  objc_msgSend(v7, "addObserver:selector:name:object:", v8, sel__currentMediaItemDidChange_, *MEMORY[0x1E0DB1E20], v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(a1);
  objc_msgSend(v9, "addObserver:selector:name:object:", v10, sel__playbackErrorDidOccur_, *MEMORY[0x1E0DB1E48], v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained(a1);
  objc_msgSend(v11, "addObserver:selector:name:object:", v12, sel__externalPlaybackTypeDidChange_, *MEMORY[0x1E0DB1F90], v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained(a1);
  objc_msgSend(v13, "addObserver:selector:name:object:", v14, sel__networkReachbilityDidChange_, *MEMORY[0x1E0DC6B70], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_loadWeakRetained(a1);
  objc_msgSend(v15, "addObserver:selector:name:object:", v16, sel__playerRateDidChange_, *MEMORY[0x1E0DB1E50], v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_loadWeakRetained(a1);
  objc_msgSend(v17, "addObserver:selector:name:object:", v18, sel__didPlayToEnd_, *MEMORY[0x1E0DB1E38], v4);

  v19 = objc_loadWeakRetained(a1);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v19, CFSTR("avPlayer"), 0, __PlayerAVPlayerKVOContext_0);

  v20 = objc_loadWeakRetained(a1);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v20, CFSTR("initialMediaItemHasCompletedInitialLoading"), 0, __PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext);

  v21 = objc_loadWeakRetained(a1);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v21, CFSTR("duration"), 0, __PlayerMediaItemDurationKVOContext);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_649(id *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(v6, "removeObserver:name:object:", WeakRetained, 0, v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(a1);
  objc_msgSend(v8, "removeObserver:name:object:", v9, *MEMORY[0x1E0DC6B70], 0);

  v10 = objc_loadWeakRetained(a1);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", v10, CFSTR("avPlayer"), __PlayerAVPlayerKVOContext_0);

  v11 = objc_loadWeakRetained(a1);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", v11, CFSTR("initialMediaItemHasCompletedInitialLoading"), __PlayerInitialMediaItemHasCompletedInitialLoadingKVOContext);

  v12 = objc_loadWeakRetained(a1);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", v12, CFSTR("duration"), __PlayerMediaItemDurationKVOContext);

  if (a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5;
    block[3] = &unk_1E9F98DF0;
    v14 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6(uint64_t a1)
{
  id v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mainPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v6, "mainPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v7);

  }
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v8, "extrasPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v10, "extrasPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v11);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v2;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  v17 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v17, "backgroundAudioPlayer", (_QWORD)v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "invalidate");

  v19 = objc_loadWeakRetained(v3);
  objc_msgSend(v19, "setBackgroundAudioPlayer:", 0);

  v20 = objc_loadWeakRetained(v3);
  objc_msgSend(v20, "setActivePlayer:", 0);

  v21 = objc_loadWeakRetained(v3);
  objc_msgSend(v21, "setMainPlayer:", 0);

  v22 = objc_loadWeakRetained(v3);
  objc_msgSend(v22, "setExtrasPlayer:", 0);

}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  NSObject *v13;
  const __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  const __CFString *v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v29;
  uint8_t buf[4];
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_loadWeakRetained(v6);
    if (objc_msgSend(v9, "dismissalOperation") == 1)
    {
      v10 = objc_loadWeakRetained(v6);
      objc_msgSend(v10, "presentingViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v13 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          v14 = CFSTR("NO");
          if ((_DWORD)a2)
            v14 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v31 = v14;
          _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Popping presenting view controller; animated? %@",
            buf,
            0xCu);
        }
        v15 = objc_loadWeakRetained(v6);
        objc_msgSend(v15, "presentingViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "navigationController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v17, "popViewControllerAnimated:", a2);

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_652;
        block[3] = &unk_1E9F98E68;
        v29 = v5;
        dispatch_async(MEMORY[0x1E0C80D38], block);
        v19 = v29;
        goto LABEL_17;
      }
    }
    else
    {

    }
    v21 = objc_loadWeakRetained(v6);
    v22 = objc_msgSend(v21, "dismissalOperation");

    if (v22 != 2)
    {
      v20 = 0;
      goto LABEL_19;
    }
    v23 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      v24 = CFSTR("NO");
      if ((_DWORD)a2)
        v24 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v31 = v24;
      _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "Dismissing presenting view controller; animated? %@",
        buf,
        0xCu);
    }
    v16 = objc_loadWeakRetained(v6);
    objc_msgSend(v16, "presentingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dismissViewControllerAnimated:completion:", a2, v5);
LABEL_17:

    v20 = 1;
LABEL_19:
    v25 = objc_loadWeakRetained(v6);
    objc_msgSend(v25, "setPresentingViewController:", 0);

    goto LABEL_20;
  }
  v20 = 0;
LABEL_20:
  v26 = objc_loadWeakRetained(v6);
  objc_msgSend(v26, "setDismissalOperation:", 0);

  return v20;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_652(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_654(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PlayerViewControllerKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v4, VUIPlaybackManagerNotificationKeyPlayerViewController);
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_655;
  v8[3] = &unk_1E9F9A938;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v7 = v5;
  v9 = v7;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v6 + 16))(v6, 1, v8);

  objc_destroyWeak(&v10);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_655(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "playbackContainerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_656;
    v11[3] = &unk_1E9F9B6C0;
    v12 = *(id *)(a1 + 32);
    objc_copyWeak(&v13, v2);
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, v11);

    objc_destroyWeak(&v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = VUIPlaybackManagerPlayerControllerDismissedAfterPIPingNotification[0];
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(v10, "postNotificationName:object:userInfo:", v8, 0, v9);

  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_656(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  id v6;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = VUIPlaybackManagerPlayerControllerDismissedAfterPIPingNotification[0];
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, 0, v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "unembedMultiPlayerViewController");

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_658(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_659;
  v4[3] = &unk_1E9F99C98;
  objc_copyWeak(&v5, v1);
  objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v4);

  objc_destroyWeak(&v5);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_659(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
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
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  double v27;
  VideosExtrasPresenter *v28;
  id v29;
  void *v30;
  VideosExtrasPresenter *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  BOOL v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id *location;
  _QWORD v72[6];
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _QWORD v84[4];
  id v85[5];
  _QWORD v86[6];

  v86[4] = *MEMORY[0x1E0C80C00];
  location = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "avPlayerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customControlsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transportControlsAreaLayoutGuide");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(location);
  objc_msgSend(v4, "avPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOverlayView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v68, "addSubview:", v6);
  v64 = (void *)MEMORY[0x1E0CB3718];
  v70 = v6;
  objc_msgSend(v6, "centerXAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "centerXAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v65;
  objc_msgSend(v6, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v9;
  objc_msgSend(v6, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v12;
  objc_msgSend(v70, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v86[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "activateConstraints:", v16);

  objc_msgSend(v68, "layoutIfNeeded");
  objc_msgSend(v70, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v70, "removeFromSuperview");
  v25 = objc_loadWeakRetained(location);
  objc_msgSend(v25, "extrasPresenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = v26 == 0;

  v27 = v20 + v24 + -70.3332977;
  if ((_DWORD)v13)
  {
    v28 = [VideosExtrasPresenter alloc];
    v29 = objc_loadWeakRetained(location);
    objc_msgSend(v29, "extrasContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[VideosExtrasPresenter initWithExtrasContext:extrasMenuBarFrame:](v28, "initWithExtrasContext:extrasMenuBarFrame:", v30, *(double *)&v18, v27, *(double *)&v22, 70.3332977);

    v32 = objc_loadWeakRetained(location);
    objc_msgSend(v32, "setExtrasPresenter:", v31);

  }
  v33 = objc_loadWeakRetained(location);
  objc_msgSend(v33, "avPlayerViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  v37 = v36;
  v39 = v38;

  v40 = objc_loadWeakRetained(location);
  objc_msgSend(v40, "extrasContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "extrasRootViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setInitialPresentationSize:", v37, v39);

  v43 = objc_loadWeakRetained(location);
  objc_msgSend(v43, "avPlayerViewController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "vui_viewControllerForFullScreenPresentation");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_loadWeakRetained(location);
  objc_msgSend(v46, "extrasPresenter");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = MEMORY[0x1E0C809B0];
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_661;
  v84[3] = &unk_1E9F9D2E0;
  objc_copyWeak(v85, location);
  v85[1] = v18;
  v85[2] = *(id *)&v27;
  v85[3] = v22;
  v85[4] = (id)0x40519554C0000000;
  objc_msgSend(v47, "presentExtrasWith:animated:completion:", v45, 1, v84);

  v49 = objc_loadWeakRetained(location);
  objc_msgSend(v49, "activePlayer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_loadWeakRetained(location);
  objc_msgSend(v51, "extrasPlayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v50 == v52;

  if (!v53)
  {
    v78 = 0;
    v79 = &v78;
    v80 = 0x3032000000;
    v81 = __Block_byref_object_copy__7;
    v82 = __Block_byref_object_dispose__7;
    v83 = 0;
    v74 = 0;
    v75 = &v74;
    v76 = 0x2020000000;
    v77 = 0;
    v54 = objc_loadWeakRetained(location);
    objc_msgSend(v54, "extrasContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "selectedMainMenuIndex");

    v77 = v56;
    if (v75[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v57 = objc_loadWeakRetained(location);
      objc_msgSend(v57, "extrasContext");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "mainMenuItemElements");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v48;
      v72[1] = 3221225472;
      v72[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_662;
      v72[3] = &unk_1E9F9D308;
      objc_copyWeak(&v73, location);
      v72[4] = &v78;
      v72[5] = &v74;
      objc_msgSend(v59, "enumerateObjectsUsingBlock:", v72);

      if (v79[5])
      {
        v60 = objc_loadWeakRetained(location);
        objc_msgSend(v60, "extrasContext");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setClearsStackOnNextPush");

        v62 = objc_loadWeakRetained(location);
        objc_msgSend(v62, "extrasContext");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setSelectedMainMenuIndex:", v75[3]);

        objc_msgSend((id)v79[5], "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, 0, 0);
      }
      objc_destroyWeak(&v73);
    }
    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(&v78, 8);

  }
  objc_destroyWeak(v85);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_661(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pause");

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "extrasContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extrasRootViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showExtrasMenuBarInFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_662(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id WeakRetained;
  void *v9;
  char v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "extrasContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isMenuItemElementMainFeature:", v11);

  if ((v10 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

BOOL __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_664(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  int v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[16];

  v5 = a3;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "setExtrasPresenter:", 0);

  v8 = objc_loadWeakRetained(v6);
  objc_msgSend(v8, "backgroundAudioPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_loadWeakRetained(v6);
    objc_msgSend(v10, "backgroundAudioPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    v12 = objc_loadWeakRetained(v6);
    objc_msgSend(v12, "setBackgroundAudioPlayer:", 0);

  }
  v13 = objc_loadWeakRetained(v6);
  objc_msgSend(v13, "mainAVPlayerViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentingViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = sLogObject_5;
  v17 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Going back to main content", buf, 2u);
    }
    v18 = objc_loadWeakRetained(v6);
    v19 = objc_msgSend(v18, "_isNewPostPlayEnabled");

    if (v19)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_665;
      v21[3] = &unk_1E9F9A060;
      objc_copyWeak(&v23, v6);
      v22 = v5;
      objc_msgSend(v15, "dismissViewControllerAnimated:completion:", a2, v21);

      objc_destroyWeak(&v23);
    }
    else
    {
      objc_msgSend(v15, "dismissViewControllerAnimated:completion:", a2, v5);
    }
  }
  else if (v17)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Cannot go back to main content, presentingViewController is nil.", buf, 2u);
  }

  return v15 != 0;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_665(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, *(_QWORD *)(a1 + 32));

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_666(uint64_t a1, char a2, char a3)
{
  id *v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;
  char v10;
  char v11;

  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_667;
  v8[3] = &unk_1E9F9D330;
  objc_copyWeak(&v9, v5);
  v10 = a2;
  v11 = a3;
  objc_msgSend(v7, "executeBlockAfterCurrentStateTransition:", v8);

  objc_destroyWeak(&v9);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_667(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mainAVPlayerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "mainAVPlayerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAvPlayerViewController:", v6);

  }
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "backgroundAudioPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stop");

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "backgroundAudioPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "setBackgroundAudioPlayer:", 0);

  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appController");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_loadWeakRetained(v2);
  objc_msgSend(v15, "setPresentingViewController:", v14);

  v16 = objc_loadWeakRetained(v2);
  objc_msgSend(v16, "setDismissalOperation:", 0);

  v17 = objc_loadWeakRetained(v2);
  objc_msgSend(v17, "mainPlayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActivePlayer:", v18);

  if (*(_BYTE *)(a1 + 40))
  {
    v19 = objc_loadWeakRetained(v2);
    objc_msgSend(v19, "mainPlayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "play");

  }
  v21 = objc_loadWeakRetained(v2);
  objc_msgSend(v21, "extrasPresenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_loadWeakRetained(v2);
    objc_msgSend(v23, "extrasPresenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dismissExtrasAnimated:completion:", *(unsigned __int8 *)(a1 + 41), 0);

  }
  v25 = objc_loadWeakRetained(v2);
  objc_msgSend(v25, "setExtrasPresenter:", 0);

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_669(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v28;
  const char *v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[16];

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "_isNewPostPlayEnabled");

  v5 = objc_loadWeakRetained(v2);
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "playbackContainerViewController");
  else
    objc_msgSend(v5, "avPlayerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = objc_loadWeakRetained(v2);
  objc_msgSend(v13, "extrasContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v28 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v29 = "Not returning to Extras because context has gone away, probably due to an error";
LABEL_13:
      _os_log_impl(&dword_1D96EE000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
    }
LABEL_14:
    v30 = objc_loadWeakRetained(v2);
    objc_msgSend(v30, "mainAVPlayerViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAvPlayerViewController:", v31);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    return CFSTR("Showing video full screen");
  }
  v15 = objc_loadWeakRetained(v2);
  objc_msgSend(v15, "extrasContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "shouldExtrasBeVisibleForSize:", v10, v12);

  if ((v17 & 1) == 0)
  {
    v28 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v29 = "Not returning to Extras because they cannot be displayed for the current view size";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v18 = objc_loadWeakRetained(v2);
  objc_msgSend(v18, "mainAVPlayerViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAvPlayerViewController:", v19);

  v20 = objc_loadWeakRetained(v2);
  objc_msgSend(v20, "extrasAVPlayerViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentingViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_loadWeakRetained(v2);
    objc_msgSend(v23, "extrasAVPlayerViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  v25 = objc_loadWeakRetained(v2);
  objc_msgSend(v25, "stateMachine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_670;
  v32[3] = &unk_1E9F99C98;
  objc_copyWeak(&v33, v2);
  objc_msgSend(v26, "executeBlockAfterCurrentStateTransition:", v32);

  objc_destroyWeak(&v33);
  return CFSTR("Showing Extras content");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_670(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "backgroundAudioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "play");
  }
  else
  {
    v3 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "No active backgroundAudioPlayer available", v4, 2u);
    }
  }

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_672(uint64_t a1, int a2, int a3, int a4, unsigned int a5, int a6, int a7, void *a8)
{
  id *v11;
  id WeakRetained;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  char v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  int v72;
  id v73;
  void *v74;
  BOOL v75;
  _BOOL4 v76;
  id v77;
  void *v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  _BOOL4 v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  int v101;
  void (**v106)(void);
  void *v107;
  _QWORD v108[4];
  id v109;
  uint8_t buf[16];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v106 = a8;
  v11 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setExtrasContext:", 0);

  v13 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v13, "setExtrasPresenter:", 0);

  v14 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v14, "setMoreInfoCanonicalViewController:", 0);

  v15 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v15, "setDateAppWasBackgrounded:", 0);

  v16 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v16, "setShouldRestartIfAppHasBeenBackgroundedTooLong:", 0);

  v17 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v17, "setDatePlaybackWasPaused:", 0);

  v18 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v18, "pausedTooLongTimer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "invalidate");

  v20 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v20, "setPausedTooLongTimer:", 0);

  v21 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v21, "activePlayer");
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a6 & 1) == 0 && (objc_msgSend(v107, "initialMediaItemHasCompletedInitialLoading") & 1) == 0)
  {
    objc_msgSend(v107, "currentMediaItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 && (objc_msgSend(v23, "complete") & 1) == 0)
      objc_msgSend(v23, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1EF0], *MEMORY[0x1E0DB1F30]);

  }
  if ((a4 & 1) == 0)
  {
    v24 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v24, "mainAVPlayerViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDelegate:", 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v26 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v26, "_removePlayerFromTimedMetadataManager:", v107);

  v27 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v27, "timedMetadataDebuggerViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stopObserving");

  if (a2)
    objc_msgSend(v107, "stop");
  v29 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v29, "setSavedErrorUserInfo:", 0);

  v30 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v30, "setSavedErrorContext:", 0);

  v31 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v31, "setFeatureMonitor:", 0);

  v32 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v32, "setRatingImage:", 0);

  v33 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v33, "setPhotoSensitivityImage:", 0);

  v34 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v34, "ratingView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeFromSuperview");

  v36 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v36, "setRatingView:", 0);

  v37 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v37, "setProductPlacementImage:", 0);

  v38 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v38, "productPlacementView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "removeFromSuperview");

  v40 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v40, "setProductPlacementView:", 0);

  v41 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v41, "setLogoImageDownloader:", 0);

  if (a2)
  {
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v42 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v42, "multiviewPlaybackInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v112;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v112 != v45)
            objc_enumerationMutation(v43);
          v47 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
          objc_msgSend(v47, "player");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stop");

          objc_msgSend(v47, "player");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "invalidate");

        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v111, v115, 16);
      }
      while (v44);
    }

    v50 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v50, "multiviewPlaybackInfo");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "removeAllObjects");

  }
  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v53, "mainAVPlayerViewController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "resetPlayerTabsForPlayerViewController:", v54);

  v55 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v55, "performanceDebuggerViewController");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "clear");

  v57 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v57, "setHasPerformanceDebuggerAppeared:", 0);

  v58 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v58, "stateMachine");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "currentState");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v60, "isEqualToString:", CFSTR("Returning post play PiP to fullscreen with playback UI")))
  {

  }
  else
  {
    v61 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v61, "stateMachine");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "currentState");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("Returning post play PiP to fullscreen without playback UI"));

    if ((v64 & 1) != 0)
      goto LABEL_25;
    v65 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v65, "setAutoPlayedVideosCount:", 0);

    v58 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v58, "setInitialPlaybackStartDate:", 0);
  }

LABEL_25:
  v66 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v66, "setConfiguredPostPlay:", 0);

  v67 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v67, "_mainPlayerViewControllerRemoveAllCustomControlItems");

  v68 = (void *)MEMORY[0x1E0DE7910];
  v69 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v68, "cancelPreviousPerformRequestsWithTarget:selector:object:", v69, sel__avPlayerViewControllerPresentationDidTimeout, 0);

  v70 = objc_loadWeakRetained((id *)(a1 + 48));
  LODWORD(v69) = objc_msgSend(v70, "_isNewPostPlayEnabled");

  if ((_DWORD)v69)
  {
    v71 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v71, "setDismissalOperation:", 2);

  }
  if ((a4 & 1) != 0)
    v72 = 0;
  else
    v72 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v73 = objc_loadWeakRetained(v11);
  objc_msgSend(v73, "avPlayerViewController");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74 == 0;

  if (v75)
  {
    v76 = 0;
  }
  else
  {
    if (((a3 ^ 1 | v72) & 1) != 0)
    {
      v76 = 0;
    }
    else
    {
      v77 = objc_loadWeakRetained(v11);
      objc_msgSend(v77, "avPlayerViewController");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "presentingViewController");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      v76 = v79 != 0;
      if (v79)
      {
        v80 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v80, OS_LOG_TYPE_DEFAULT, "Dismissing AVPlayerViewController", buf, 2u);
        }
        objc_msgSend(v79, "dismissViewControllerAnimated:completion:", a5, v106);
      }

    }
    v81 = sLogObject_5;
    v82 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
    if (a4)
    {
      if (v82)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v81, OS_LOG_TYPE_DEFAULT, "Keeping existing AVPlayerViewcontroller to re-use", buf, 2u);
      }
    }
    else
    {
      if (v82)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v81, OS_LOG_TYPE_DEFAULT, "Removing references to existing AVPlayerViewController", buf, 2u);
      }
      v83 = objc_loadWeakRetained(v11);
      objc_msgSend(v83, "setAvPlayerViewController:", 0);

      v84 = objc_loadWeakRetained(v11);
      objc_msgSend(v84, "setMainAVPlayerViewController:", 0);

    }
    v85 = objc_loadWeakRetained(v11);
    objc_msgSend(v85, "setExtrasAVPlayerViewController:", 0);

    v86 = objc_loadWeakRetained(v11);
    objc_msgSend(v86, "setPostPlayView:", 0);

  }
  if ((a4 & 1) == 0)
  {
    if (a6)
    {
      v87 = objc_loadWeakRetained(v11);
      objc_msgSend(v87, "playbackContainerViewController");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "removePostPlayViewController");

    }
    v89 = objc_loadWeakRetained(v11);
    objc_msgSend(v89, "playbackContainerViewController");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "presentingViewController");
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = objc_loadWeakRetained(v11);
    objc_msgSend(v92, "playbackContainerViewController");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v93;
    if (v91)
    {
      v108[0] = MEMORY[0x1E0C809B0];
      v108[1] = 3221225472;
      v108[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_676;
      v108[3] = &unk_1E9F99C98;
      objc_copyWeak(&v109, v11);
      objc_msgSend(v94, "dismissViewControllerAnimated:completion:", 0, v108);

      objc_destroyWeak(&v109);
    }
    else
    {
      v95 = (id)objc_msgSend(v93, "unembedMultiPlayerViewController");

      v96 = objc_loadWeakRetained(v11);
      objc_msgSend(v96, "setMultiPlayerViewController:", 0);

      v97 = objc_loadWeakRetained(v11);
      objc_msgSend(v97, "setPlaybackContainerViewController:", 0);

    }
  }
  if (a7)
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "groupActivitiesManager");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "leaveSession");

  }
  v100 = objc_loadWeakRetained(v11);
  objc_msgSend(v100, "_clearActivityItemsConfiguration");

  if (v106)
    v101 = v76;
  else
    v101 = 1;
  if (((v101 | v72) & 1) == 0)
    v106[2]();

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_676(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "unembedMultiPlayerViewController");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setMultiPlayerViewController:", 0);

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "setPlaybackContainerViewController:", 0);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_678(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id *v18;
  id WeakRetained;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  int v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v3)
  {

LABEL_11:
    v18 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "datePlaybackWasPaused");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "Setting date playback was paused to nil", (uint8_t *)&v38, 2u);
      }
      v22 = objc_loadWeakRetained(v18);
      objc_msgSend(v22, "setDatePlaybackWasPaused:", 0);

    }
    v23 = objc_loadWeakRetained(v18);
    objc_msgSend(v23, "pausedTooLongTimer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "Invalidating paused too long timer", (uint8_t *)&v38, 2u);
      }
      v26 = objc_loadWeakRetained(v18);
      objc_msgSend(v26, "pausedTooLongTimer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "invalidate");

      v28 = objc_loadWeakRetained(v18);
      objc_msgSend(v28, "setPausedTooLongTimer:", 0);

    }
    goto LABEL_19;
  }
  v5 = (id *)(a1 + 32);
  v6 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "activePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasTrait:", VUIMediaItemTraitStopWhenPausedForTooLong);

  if (!v9)
    goto LABEL_11;
  v10 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v10, "datePlaybackWasPaused");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 138412290;
      v39 = (uint64_t)v12;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Setting date playback was paused to %@", (uint8_t *)&v38, 0xCu);
    }
    v14 = objc_loadWeakRetained(v5);
    objc_msgSend(v14, "setDatePlaybackWasPaused:", v12);

  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "applicationState");

  if (v16 == 2)
  {
    v17 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Not creating paused too long timer since app is backgrounded. Will create the timer when app becomes foregrounded", (uint8_t *)&v38, 2u);
    }
  }
  else
  {
    v29 = objc_loadWeakRetained(v5);
    objc_msgSend(v29, "pausedTooLongTimer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v31 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        v38 = 134218240;
        v39 = 0x408C200000000000;
        v40 = 2048;
        v41 = 0x402E000000000000;
        _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_DEFAULT, "Creating paused too long timer.  Will stop after %f seconds (%f minutes) of being paused", (uint8_t *)&v38, 0x16u);
      }
      v32 = (void *)MEMORY[0x1E0C99E88];
      v33 = objc_loadWeakRetained(v5);
      objc_msgSend(v32, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v33, sel__handlePausedTooLong_, 0, 0, 900.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = objc_loadWeakRetained(v5);
      objc_msgSend(v35, "pausedTooLongTimer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "invalidate");

      v37 = objc_loadWeakRetained(v5);
      objc_msgSend(v37, "setPausedTooLongTimer:", v34);

    }
  }
LABEL_19:

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_680(uint64_t a1, int a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[9];
  _QWORD aBlock[4];
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[8];
  _QWORD v45[4];
  id v46;
  CGRect v47;

  v5 = a3;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = objc_msgSend(WeakRetained, "_isNewPostPlayEnabled");

  v9 = objc_loadWeakRetained(v6);
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "mainPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_loadWeakRetained(v6);
      objc_msgSend(v12, "_markMainPlayerMediaItemPostPlayActive:", 0);

    }
    v13 = objc_loadWeakRetained(v6);
    objc_msgSend(v13, "playbackContainerViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_681;
    v45[3] = &unk_1E9F98E68;
    v46 = v5;
    objc_msgSend(v14, "exitPictureInPictureWithCompletion:", v45);

    v15 = v46;
  }
  else
  {
    objc_msgSend(v9, "activePlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentMediaItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_loadWeakRetained(v6);
    objc_msgSend(v17, "postPlayView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPostPlayItemMetrics"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained(v6);
    objc_msgSend(v20, "activePlayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMediaItemEndAction:", 0);

    v22 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "Dismissing PostPlay View", buf, 2u);
    }
    v23 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_682;
    aBlock[3] = &unk_1E9F9D3F8;
    v24 = v18;
    v40 = v24;
    objc_copyWeak(&v43, v6);
    v25 = v19;
    v41 = v25;
    v42 = v5;
    v26 = _Block_copy(aBlock);
    if (a2)
    {
      objc_msgSend(v24, "frame");
      y = v47.origin.y;
      width = v47.size.width;
      height = v47.size.height;
      v30 = v47.origin.x + CGRectGetWidth(v47);
      v31 = (void *)MEMORY[0x1E0DC3F10];
      v38[0] = v23;
      v38[1] = 3221225472;
      v38[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_683;
      v38[3] = &unk_1E9F9D420;
      v32 = v38;
      v38[4] = v24;
      *(CGFloat *)&v38[5] = v30;
      *(CGFloat *)&v38[6] = y;
      *(CGFloat *)&v38[7] = width;
      *(CGFloat *)&v38[8] = height;
      v37[0] = v23;
      v37[1] = 3221225472;
      v33 = v37;
      v37[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_684;
      v37[3] = &unk_1E9F98E18;
      v37[4] = v26;
      objc_msgSend(v31, "animateWithDuration:delay:options:animations:completion:", 0, v38, v37, 0.5, 0.0);
    }
    else
    {
      v34 = (void *)MEMORY[0x1E0DC3F10];
      v36[0] = v23;
      v36[1] = 3221225472;
      v36[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_685;
      v36[3] = &unk_1E9F98DF0;
      v32 = v36;
      v36[4] = v24;
      v35[0] = v23;
      v35[1] = 3221225472;
      v35[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_686;
      v35[3] = &unk_1E9F98E18;
      v33 = v35;
      v35[4] = v26;
      objc_msgSend(v34, "animateWithDuration:delay:options:animations:completion:", 5242880, v36, v35, 0.5, 0.0);
    }

    objc_destroyWeak(&v43);
  }

}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_681(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_682(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t result;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_removeVideoDimmingViewForPostPlay");

  v3 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v3, "avPlayerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaybackControlsIncludeTransportControls:", 1);

  objc_msgSend(*(id *)(a1 + 32), "stopAutoPlayTimer");
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v5, "postPlayImpressionTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v7, "postPlayImpressionTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("VUIContentMetadataPostPlayItemMetricsImpressionsDataKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("impressions"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      if (v11 && v13)
      {
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("impressionTimes"));
        v14 = (void *)objc_msgSend(v13, "copy");
        v18 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("impressions"));

        +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "recordImpressions:", v11);

      }
    }

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_683(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_684(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_685(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_686(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_688(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD);
  id v17;
  _QWORD aBlock[4];
  id v19;
  id v20;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConfiguredPostPlay:", 0);

  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_689;
  aBlock[3] = &unk_1E9F9A938;
  objc_copyWeak(&v20, v4);
  v7 = v3;
  v19 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v9 = objc_loadWeakRetained(v4);
  v10 = objc_msgSend(v9, "_isNewPostPlayEnabled");

  if (v10)
  {
    objc_msgSend(v7, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DB1DC0]) & 1) != 0
      || (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DB1DD8]) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DB1DD0]))
    {
      v8[2](v8);
      v12 = objc_loadWeakRetained(v4);
      objc_msgSend(v12, "playbackContainerViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "loadPostPlayForMediaItem:", v7);

    }
  }
  else
  {
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_691;
    v14[3] = &unk_1E9F9D470;
    objc_copyWeak(&v17, v4);
    v15 = v7;
    v16 = v8;
    +[VUIPostPlayDataManager fetchPostPlayItemForCurrentMediaItem:completion:](VUIPostPlayDataManager, "fetchPostPlayItemForCurrentMediaItem:completion:", v15, v14);

    objc_destroyWeak(&v17);
  }

  objc_destroyWeak(&v20);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_689(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  VUINowPlayingTimeBoundFeature *v21;
  NSObject *v22;
  int v23;
  VUINowPlayingTimeBoundFeature *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "activePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v6 = v5;

  if (v6 != *MEMORY[0x1E0DB1998])
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BC0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playbackUpNextConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (objc_msgSend(v11, "minTimeIntervalFromEndToDisplay"), v6 - v9 >= v12)
      || (v13 = (void *)MEMORY[0x1E0CB37E8],
          objc_msgSend(v11, "minTimeIntervalFromEndToDisplay"),
          objc_msgSend(v13, "numberWithDouble:", v6 - v14),
          v15 = objc_claimAutoreleasedReturnValue(),
          v7,
          (v7 = (void *)v15) != 0))
    {
      v16 = objc_loadWeakRetained(v2);
      objc_msgSend(v16, "featureMonitor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "doubleValue");
      v19 = v18;
      objc_msgSend(v17, "featuresForType:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (VUINowPlayingTimeBoundFeature *)objc_claimAutoreleasedReturnValue();

      if (v21)
        -[VUINowPlayingTimeBoundFeature setStartTime:](v21, "setStartTime:", v19);
      else
        v21 = -[VUINowPlayingTimeBoundFeature initWithType:startTime:duration:]([VUINowPlayingTimeBoundFeature alloc], "initWithType:startTime:duration:", 2, v19, INFINITY);
      v22 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138412290;
        v24 = v21;
        _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "configured post play feature:<%@>", (uint8_t *)&v23, 0xCu);
      }
      objc_msgSend(v17, "addFeature:", v21);

    }
  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_691(uint64_t a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6, void *a7)
{
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  id *v18;
  id WeakRetained;
  int v20;
  id *v21;
  __CFString **v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  VUIPostPlayView *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  VUIPostPlayView *v59;
  VUIPostPlayView *v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  unsigned int v67;
  void *v68;
  void *v69;
  void *v70;
  uint8_t buf[16];

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  if (v14 | v15)
  {
    v18 = (id *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v20 = objc_msgSend(WeakRetained, "isFullscreenPlaybackUIBeingShown");

    if (v20)
    {
      if (v14)
      {
        objc_msgSend((id)v14, "setMediaItemMetadata:forProperty:", &unk_1EA0B9538, *MEMORY[0x1E0DB1CA0]);
        v21 = (id *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", v13, CFSTR("VUIMediaItemMetadataUpNextPostPlayMediaInfo"));
        v22 = (__CFString **)MEMORY[0x1E0DB1CE0];
        v23 = (id)v14;
      }
      else
      {
        if (!v16)
          goto LABEL_10;
        v21 = (id *)(a1 + 32);
        v22 = VUIContentMetadataPostPlayItemUpsellRouterDataSource;
        v23 = v16;
      }
      objc_msgSend(*v21, "setMediaItemMetadata:forProperty:", v23, *v22);
LABEL_10:
      if (v17)
        objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", v17, CFSTR("VUIContentMetadataPostPlayItemMetrics"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v25 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v25, "avPlayerViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "contentOverlayView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        goto LABEL_25;
      v62 = v16;
      v63 = v13;
      v67 = a6;
      objc_msgSend(v27, "traitCollection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "isAXEnabled"))
        v29 = 271.0;
      else
        v29 = 190.0;

      objc_msgSend((id)v15, "objectForKey:", CFSTR("postPlayHeader"));
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v15, "objectForKey:", CFSTR("postPlayTitle"));
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v15, "objectForKey:", CFSTR("postPlayImage"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v15, "objectForKey:", CFSTR("postPlayId"));
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = objc_loadWeakRetained(v18);
      v65 = (void *)v33;
      objc_msgSend(v34, "setPostPlayItemId:", v33);

      v66 = v32;
      objc_msgSend(v32, "objectForKey:", CFSTR("src"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = (void *)v31;
      v70 = (void *)v30;
      v64 = v35;
      if (objc_msgSend(v35, "length"))
      {
        v36 = v30;
        v37 = objc_loadWeakRetained(v18);
        v38 = -[VUIPostPlayView initWithFrame:andEpisodeArtworkURLStringFormat:andTitle:andHeader:]([VUIPostPlayView alloc], "initWithFrame:andEpisodeArtworkURLStringFormat:andTitle:andHeader:", v35, v31, v36, 0.0, 0.0, v29, 186.0);
        objc_msgSend(v37, "setPostPlayView:", v38);
        v39 = v67;
        v16 = v62;
        v13 = v63;
      }
      else
      {
        v39 = v67;
        v16 = v62;
        v13 = v63;
        if (!v14)
        {
LABEL_24:
          v40 = objc_loadWeakRetained(v18);
          objc_msgSend(v40, "postPlayView");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v27;
          v42 = objc_loadWeakRetained(v18);
          objc_msgSend(v41, "setDelegate:", v42);

          v43 = objc_loadWeakRetained(v18);
          objc_msgSend(v43, "postPlayView");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setCanAutoPlay:", v39);

          v45 = objc_loadWeakRetained(v18);
          objc_msgSend(v45, "postPlayView");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setAutoresizingMask:", 9);

          v47 = objc_alloc(MEMORY[0x1E0DC3D80]);
          v48 = objc_loadWeakRetained(v18);
          v49 = (void *)objc_msgSend(v47, "initWithTarget:action:", v48, sel__postPlayItemSelected_);

          v50 = objc_loadWeakRetained(v18);
          objc_msgSend(v50, "postPlayView");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addGestureRecognizer:", v49);

          v52 = objc_alloc(MEMORY[0x1E0DC3D10]);
          v53 = objc_loadWeakRetained(v18);
          v54 = (void *)objc_msgSend(v52, "initWithTarget:action:", v53, sel__dismissPostPlayWithSwipe_);

          objc_msgSend(v54, "setDirection:", 1);
          v55 = objc_loadWeakRetained(v18);
          objc_msgSend(v55, "postPlayView");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addGestureRecognizer:", v54);

          v57 = objc_loadWeakRetained(v18);
          objc_msgSend(v57, "stateMachine");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "postEvent:", CFSTR("Post play has been configured"));

          v27 = v68;
LABEL_25:

          goto LABEL_26;
        }
        objc_msgSend((id)v14, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19D0]);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v38 = (VUIPostPlayView *)objc_loadWeakRetained(v18);
          v60 = -[VUIPostPlayView initWithFrame:andTVImageProxy:andTitle:andHeader:]([VUIPostPlayView alloc], "initWithFrame:andTVImageProxy:andTitle:andHeader:", v37, v69, v70, 0.0, 0.0, v29, 186.0);
          -[VUIPostPlayView setPostPlayView:](v38, "setPostPlayView:");

        }
        else
        {
          objc_msgSend((id)v14, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19E8]);
          v38 = (VUIPostPlayView *)objc_claimAutoreleasedReturnValue();
          v61 = objc_loadWeakRetained(v18);
          v59 = -[VUIPostPlayView initWithFrame:andEpisodeArtworkURLStringFormat:andTitle:andHeader:]([VUIPostPlayView alloc], "initWithFrame:andEpisodeArtworkURLStringFormat:andTitle:andHeader:", v38, v69, v70, 0.0, 0.0, v29, 186.0);
          objc_msgSend(v61, "setPostPlayView:", v59);

        }
      }

      goto LABEL_24;
    }
  }
  v24 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "No post play item for current media item", buf, 2u);
  }
LABEL_26:

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_700(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  _QWORD block[4];
  id v76;
  id v77;
  id v78;
  id v79[2];
  uint8_t buf[16];
  _QWORD v81[6];
  CGRect v82;

  v81[4] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_isNewPostPlayEnabled");

  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "_markMainPlayerMediaItemPostPlayActive:", 1);

    +[VUIPostPlayUpsellConfig sharedInstance](VUIPostPlayUpsellConfig, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHasShownPostPlay:", 1);

    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "playbackContainerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enterPictureInPicture");

    v9 = objc_loadWeakRetained(v1);
    objc_msgSend(v9, "featureMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "featuresForType:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v73 = (id)objc_claimAutoreleasedReturnValue();

    v12 = objc_loadWeakRetained(v1);
    objc_msgSend(v12, "featureMonitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deactivateFeature:animated:", v73, 0);

    return;
  }
  objc_msgSend(v4, "activePlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentMediaItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CE0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "groupActivitiesManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isSessionActive");

    if (v19)
      objc_msgSend(v16, "setMediaItemMetadata:forProperty:", MEMORY[0x1E0C9AAB0], CFSTR("VUIContentMetadataDisableSpeculativeLoading"));
    v20 = objc_loadWeakRetained(v1);
    objc_msgSend(v20, "activePlayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "playlist");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "activeListIndex");

    v24 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "Adding post play item to playlist", buf, 2u);
    }
    v25 = objc_loadWeakRetained(v1);
    objc_msgSend(v25, "activePlayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "playlist");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "insertItem:atIndex:", v16, v23 + 1);

  }
  else
  {
    v28 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v28, OS_LOG_TYPE_DEFAULT, "Not adding post play item to playlist because its missing", buf, 2u);
    }
  }
  v29 = objc_loadWeakRetained(v1);
  objc_msgSend(v29, "avPlayerViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "contentOverlayView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "safeAreaLayoutGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_loadWeakRetained(v1);
  objc_msgSend(v33, "avPlayerViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "contentOverlayView");
  v74 = (id)objc_claimAutoreleasedReturnValue();

  v35 = objc_loadWeakRetained(v1);
  objc_msgSend(v35, "postPlayView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_msgSend(v36, "canAutoPlay");
  v71 = v16;
  v72 = v15;
  if (v37)
  {
    v35 = objc_loadWeakRetained(v1);
    if (objc_msgSend(v35, "allowedToAutoPlay"))
    {

      goto LABEL_18;
    }
  }
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "groupActivitiesManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isSessionActive");

  if (v37)
  {

    if ((v40 & 1) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (v40)
  {
LABEL_18:
    v41 = objc_loadWeakRetained(v1);
    objc_msgSend(v41, "activePlayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setMediaItemEndAction:", 1);

  }
LABEL_19:
  objc_msgSend(v36, "setAlpha:", 1.0);
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v74, "addSubview:", v36);
  v43 = objc_loadWeakRetained(v1);
  objc_msgSend(v43, "_addVideoDimmingViewForPostPlay");

  v44 = objc_loadWeakRetained(v1);
  objc_msgSend(v44, "avPlayerViewController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setPlaybackControlsIncludeTransportControls:", 0);

  v46 = objc_loadWeakRetained(v1);
  objc_msgSend(v46, "avPlayerViewController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "contentOverlayView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, CGRectGetWidth(v82));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = (void *)MEMORY[0x1E0CB3718];
  v81[0] = v67;
  objc_msgSend(v36, "bottomAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v32;
  objc_msgSend(v32, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:constant:", v51, -20.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v52;
  objc_msgSend(v36, "widthAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v48;
  objc_msgSend(v48, "traitCollection");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "isAXEnabled");
  v56 = 190.0;
  if (v55)
    v56 = 271.0;
  objc_msgSend(v53, "constraintEqualToConstant:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v57;
  objc_msgSend(v36, "heightAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToConstant:", 186.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v81[3] = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 4);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "activateConstraints:", v60);

  objc_msgSend(v36, "setNeedsLayout");
  objc_msgSend(v36, "layoutIfNeeded");
  objc_msgSend(v74, "setNeedsLayout");
  v61 = objc_loadWeakRetained(v1);
  objc_msgSend(v61, "setPostPlayTrailingConstraint:", v67);

  v62 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v62, OS_LOG_TYPE_DEFAULT, "Showing PostPlayView", buf, 2u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_701;
  block[3] = &unk_1E9F9D4C0;
  v79[1] = (id)0xC034000000000000;
  v76 = v67;
  v77 = v74;
  v63 = v74;
  v64 = v67;
  objc_copyWeak(v79, v1);
  v78 = v36;
  v65 = v36;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v79);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_701(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setConstant:", *(double *)(a1 + 64));
  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_702;
  v7[3] = &unk_1E9F98DF0;
  v8 = *(id *)(a1 + 40);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_703;
  v4[3] = &unk_1E9F9B058;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "animateWithDuration:delay:options:animations:completion:", 0, v7, v4, 0.5, 0.0);

  objc_destroyWeak(&v6);
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_702(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_703(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "allowedToAutoPlay");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "startAutoPlayTimer");
  }
  else
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "_resetAutoPlayBingeWatchingQualifications");

  }
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "activePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPostPlayItemMetrics"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("VUIContentMetadataPostPlayItemMetricsDialogDataKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "recordDialog:", v9);

    }
  }
  v11 = objc_loadWeakRetained(v2);
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  objc_msgSend(v12, "numberWithLong:", (uint64_t)(v14 * 1000.0));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPostPlayImpressionTime:", v15);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_704(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VUIMediaEntityFetchRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  VUIMediaEntityFetchRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  VUIMediaEntityFetchRequest *v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controllerPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_3;
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_3:
    objc_msgSend(v2, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = [VUIMediaEntityFetchRequest alloc];
      v9 = (void *)MEMORY[0x1E0C99E60];
      +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v10;
      +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v11;
      +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[VUIMediaEntityFetchRequest initWithMediaEntityTypes:](v8, "initWithMediaEntityTypes:", v14);

      VUIMediaEntityFetchRequestAllPropertiesSet();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaEntityFetchRequest setProperties:](v15, "setProperties:", v16);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "longLongValue"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaEntityFetchRequest addAdamIdPredicate:](v15, "addAdamIdPredicate:", v17);

      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "aggregateMediaLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_710;
      v22[3] = &unk_1E9F9D578;
      v23 = v2;
      v24 = v4;
      v21 = (id)objc_msgSend(v19, "enqueueFetchRequests:completionHandler:", v20, v22);

    }
    else if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
    {
      __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_704_cold_2();
    }

  }
  else if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
  {
    __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_704_cold_1();
  }

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_710(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_711;
  block[3] = &unk_1E9F99840;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_711(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "assetController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sLogObject_5;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Preflighting download of %@", buf, 0xCu);
    }
    +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = objc_msgSend(v5, "contentAllowsCellularDownload");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_713;
    v12[3] = &unk_1E9F9D550;
    v13 = *(id *)(a1 + 40);
    v14 = v5;
    objc_msgSend(v8, "preflightDownloadForTVPMediaItem:presentingViewController:contentAllowsCellularDownload:completion:", v9, v10, v11, v12);

  }
  else if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
  {
    __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_711_cold_1();
  }

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_713(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
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
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = sLogObject_5;
  v9 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v34 = v10;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Deleting existing download and starting new compatible download of %@", buf, 0xCu);
    }
    v11 = *(void **)(a1 + 40);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_714;
    v31[3] = &unk_1E9F9D528;
    v32 = v11;
    objc_msgSend(v32, "deleteAndRedownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:completion:", a3, a4, 0, v31);
    v12 = v32;
LABEL_16:

    return;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Downloading compatible video was not allowed", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "networkType");

  if (!v14)
  {
    v15 = MGGetBoolAnswer();
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((v15 & 1) != 0)
    {
      objc_msgSend(v16, "localizedStringForKey:", CFSTR("CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WLAN_TITLE"));
      v12 = (id)objc_claimAutoreleasedReturnValue();

      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WLAN_MESSAGE");
    }
    else
    {
      objc_msgSend(v16, "localizedStringForKey:", CFSTR("CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WIFI_TITLE"));
      v12 = (id)objc_claimAutoreleasedReturnValue();

      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WIFI_MESSAGE");
    }
    objc_msgSend(v18, "localizedStringForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0DC3448];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:", CFSTR("OK"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addAction:", v26);
    +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
      goto LABEL_19;
    +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "appWindow");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "rootViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
LABEL_19:
      objc_msgSend(v27, "presentedViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        objc_msgSend(v27, "presentViewController:animated:completion:", v22, 1, 0);
    }

    goto LABEL_16;
  }
}

VUIMultiviewPlaybackInfo *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_733(uint64_t a1, void *a2)
{
  id v3;
  VUIPlayer *v4;
  void *v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  VUIPlayer *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _BOOL8 v24;
  _BOOL8 v25;
  void *v26;
  id v27;
  int v28;
  VUIMultiviewPlaybackInfo *v29;
  VUIMultiviewPlaybackInfo *v31;
  _QWORD v32[4];
  VUIMultiviewPlaybackInfo *v33;
  VUIPlayer *v34;

  v3 = a2;
  v4 = [VUIPlayer alloc];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Multiview Player (%ld)"), objc_msgSend(v8, "count") + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VUIPlayer initWithName:](v4, "initWithName:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  -[TVPPlayer setReportingCategory:](v10, "setReportingCategory:", CFSTR("multiview"));
  -[TVPPlayer setReportingValueWithString:forKey:](v10, "setReportingValueWithString:forKey:", CFSTR("multiview"), CFSTR("initiator"));
  -[TVPPlayer setErrorBehavior:](v10, "setErrorBehavior:", 2);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "BOOLForKey:", CFSTR("RepeatMovieForever")))
  {

LABEL_4:
    objc_msgSend(v3, "setRepeatMode:", 2);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("RepeatOneForAllMedia"));

  if (v13)
    goto LABEL_4;
LABEL_5:
  v14 = objc_loadWeakRetained(v6);
  objc_msgSend(v14, "createPlayerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setShowsPlaybackControls:", 0);
  objc_msgSend(v15, "setCanPausePlaybackWhenExitingFullScreen:", 0);
  objc_msgSend(v3, "currentMediaItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataBroadcastLocale"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPlaysFromStartOfLiveStream"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  v31 = -[VUIMultiviewPlaybackInfo initWithPlayer:playerViewController:playsFromStart:broadcastLocale:]([VUIMultiviewPlaybackInfo alloc], "initWithPlayer:playerViewController:playsFromStart:broadcastLocale:", v10, v15, v19, v17);
  v20 = objc_loadWeakRetained(v6);
  objc_msgSend(v20, "multiviewPlaybackInfo");
  v21 = v3;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");
  v24 = v23 != 0;
  v25 = v23 == 0;

  -[TVPPlayer setPlaylist:](v10, "setPlaylist:", v21);
  objc_msgSend(v15, "setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:", 4 * v25);
  -[TVPPlayer setMuted:](v10, "setMuted:", v24);
  objc_msgSend(v15, "playerController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAllowsAudioPlayback:", v25);

  -[TVPPlayer setAllowsExternalPlayback:](v10, "setAllowsExternalPlayback:", v25);
  objc_msgSend(v15, "setUpdatesNowPlayingInfoCenter:", v25);
  v27 = objc_loadWeakRetained(v6);
  v28 = objc_msgSend(v27, "_audioContainsAirPlayRoute");

  if (v28 && v24)
  {
    -[TVPPlayer pause](v10, "pause");
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_742;
    v32[3] = &unk_1E9F98FD8;
    v29 = v31;
    v33 = v31;
    v34 = v10;
    -[VUIMultiviewPlaybackInfo waitForExternalPlaybackToBecomeType:forPlayer:completion:](v33, "waitForExternalPlaybackToBecomeType:forPlayer:completion:", 1, v34, v32);

  }
  else
  {
    -[TVPPlayer play](v10, "play");
    v29 = v31;
  }

  return v29;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_742(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_743;
  v3[3] = &unk_1E9F98DF0;
  v4 = v1;
  objc_msgSend(v2, "waitForExternalPlaybackToBecomeType:forPlayer:completion:", 0, v4, v3);

}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_743(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "play");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_745(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_746;
  v14[3] = &unk_1E9F9D5F0;
  v11 = v7;
  v15 = v11;
  v17 = *(id *)(a1 + 40);
  objc_copyWeak(&v19, (id *)(a1 + 48));
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v18 = v13;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD *))(v10 + 16))(v10, 1, 1, 0, 1, 0, 1, v14);

  objc_destroyWeak(&v19);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_746(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v37;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v37 != v5)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v7);

        objc_msgSend(v7, "playerViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v4);
  }

  v11 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v11, "_updateMultiviewReportingMetrics");

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "documentCreator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "playbackContainerViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v14, "setDelegate:", v15);

  objc_msgSend(v14, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

  v18 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v18, "setPlaybackContainerViewController:", v14);

  v19 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v19, "multiviewPlaybackInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "player");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActivePlayer:", v22);

  v23 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v23, "configureAudioSessionForBackgroundPlayback:usingPlaybackCategory:isMultiview:", 0, 0, 1);

  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v25, "multiviewIdentifiers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_747;
  v29[3] = &unk_1E9F9D5C8;
  objc_copyWeak(&v35, (id *)(a1 + 64));
  v27 = v2;
  v30 = v27;
  v31 = *(id *)(a1 + 32);
  v32 = *(id *)(a1 + 40);
  v28 = v14;
  v33 = v28;
  v34 = *(id *)(a1 + 56);
  objc_msgSend(v24, "updatePlayerTabsExcludingCanonicals:completion:", v26, v29);

  objc_destroyWeak(&v35);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_747(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "setActivePlayer:", 0);

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentCreator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v5, "createMultiPlayerViewControllerWithPlayerViewControllers:showingDetails:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "setDelegate:", v8);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "playbackContainerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "embedMultiPlayerViewController:", v7);

  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "setMultiPlayerViewController:", v7);

  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentMediaItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19E8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0DC6A10]);
    objc_msgSend(MEMORY[0x1E0DC6A98], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithObject:imageLoader:groupType:", v15, v17, 0);

    objc_msgSend(v7, "setBackgroundImageProxy:", v18);
  }
  v19 = *(void **)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 56);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_751;
  v21[3] = &unk_1E9F98E68;
  v22 = *(id *)(a1 + 64);
  objc_msgSend(v19, "presentViewController:animated:completion:", v20, 1, v21);

}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_751(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  VUIMultiviewPlaybackInfo *v14;
  void *v15;
  void *v16;
  VUIMultiviewPlaybackInfo *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  unsigned int v44;
  void *v45;
  VUIMultiviewPlaybackInfo *v46;
  void *v47;
  void *v48;
  void (**v49)(_QWORD);
  id *location;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v49 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mainAVPlayerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowsPlaybackControls:", 0);
  objc_msgSend(v9, "setCanPausePlaybackWhenExitingFullScreen:", 0);
  objc_msgSend(v9, "setCanStartPictureInPictureAutomaticallyFromInline:", 1);
  objc_msgSend(v9, "setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:", 4);
  objc_msgSend(WeakRetained, "currentMediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataBroadcastLocale"));
  v11 = objc_claimAutoreleasedReturnValue();
  v51 = v10;
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPlaysFromStartOfLiveStream"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = [VUIMultiviewPlaybackInfo alloc];
  objc_msgSend(WeakRetained, "mainPlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "mainAVPlayerViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v11;
  v17 = -[VUIMultiviewPlaybackInfo initWithPlayer:playerViewController:playsFromStart:broadcastLocale:](v14, "initWithPlayer:playerViewController:playsFromStart:broadcastLocale:", v15, v16, v13, v11);

  -[VUIMultiviewPlaybackInfo setContext:](v17, "setContext:", 1);
  objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v17;
  objc_msgSend(v18, "addObject:", v17);

  objc_msgSend(WeakRetained, "_updateMultiviewReportingMetrics");
  objc_msgSend(WeakRetained, "setActivePlayer:", 0);
  objc_msgSend(WeakRetained, "setMainPlayer:", 0);
  objc_msgSend(WeakRetained, "setMainAVPlayerViewController:", 0);
  objc_msgSend(WeakRetained, "setAvPlayerViewController:", 0);
  v48 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v44 = a2;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v20 = v7;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v57 != v23)
            objc_enumerationMutation(v20);
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v25);

          objc_msgSend(v25, "playerViewController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v27);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v22);
    }

    v28 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v28, "_updateMultiviewReportingMetrics");

    a2 = v44;
  }
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "documentCreator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v30, "createMultiPlayerViewControllerWithPlayerViewControllers:showingDetails:", v31, a2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "setDelegate:", WeakRetained);
  if ((_DWORD)a2)
    objc_msgSend(v32, "setDetailsViewControllerVisible:animated:completion:", 1, 0, 0);
  location = (id *)v7;
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "embedMultiPlayerViewController:", v32);

  objc_msgSend(WeakRetained, "setMultiPlayerViewController:", v32);
  objc_msgSend(v51, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB19E8]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = objc_alloc(MEMORY[0x1E0DC6A10]);
    objc_msgSend(MEMORY[0x1E0DC6A98], "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithObject:imageLoader:groupType:", v34, v36, 0);

    objc_msgSend(v32, "setBackgroundImageProxy:", v37);
  }
  objc_msgSend(WeakRetained, "configureAudioSessionForBackgroundPlayback:usingPlaybackCategory:isMultiview:", 0, 0, 1);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v53 != v41)
          objc_enumerationMutation(v38);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * j), "player");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setReportingCategory:", CFSTR("multiview"));

      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v40);
  }

  if (v49)
    v49[2](v49);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "multiviewPlaybackInfo", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "playerViewController");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "player");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11 == v3)
        {
          objc_msgSend(v12, "setReportingCategory:", CFSTR("fullscreen"));
LABEL_13:

          continue;
        }
        objc_msgSend(v12, "state");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setBackgroundPlayerState:", v14);

        if (objc_msgSend(v10, "isAtLiveEdge"))
        {
          objc_msgSend(v10, "setResumeDate:", 0);
        }
        else
        {
          objc_msgSend(v10, "player");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "playbackDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setResumeDate:", v16);

        }
        if (objc_msgSend(v10, "context") != 3)
        {
          objc_msgSend(v10, "player");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stop");
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "playerViewController");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 != v3)
        {
          objc_msgSend(v11, "resumeDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "player");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v13)
          {
            objc_msgSend(v11, "resumeDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setPlaybackDate:", v16);

          }
          else
          {
            objc_msgSend(v14, "currentMediaItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v17, "setIgnoreStartOverParam:", 1);
            v15 = v17;
          }

          objc_msgSend(v11, "player");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setAllowsExternalPlayback:", objc_msgSend(v11, "context") == 1);

          objc_msgSend(v11, "backgroundPlayerState");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DB1958], "paused");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19 == v20)
          {
            objc_msgSend(v11, "player");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "pause");
          }
          else
          {
            v21 = objc_loadWeakRetained(v4);
            v22 = objc_msgSend(v21, "_audioContainsAirPlayRoute");

            objc_msgSend(v11, "player");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v22)
            {
              objc_msgSend(v23, "pause");

              objc_msgSend(v11, "player");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v26[0] = MEMORY[0x1E0C809B0];
              v26[1] = 3221225472;
              v26[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11;
              v26[3] = &unk_1E9F98DF0;
              v26[4] = v11;
              objc_msgSend(v11, "waitForExternalPlaybackToBecomeType:forPlayer:completion:", 1, v24, v26);
            }
            else
            {
              objc_msgSend(v23, "play");
            }
          }

        }
        objc_msgSend(v11, "setPausedDueToInterruption:", 0);
        objc_msgSend(v11, "player");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setReportingCategory:", CFSTR("multiview"));

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12;
  v4[3] = &unk_1E9F98DF0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "waitForExternalPlaybackToBecomeType:forPlayer:completion:", 0, v3, v4);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "play");

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;

  v8 = a2;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("AnimatedKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_14;
  v18[3] = &unk_1E9F9D690;
  v13 = *(id *)(a1 + 32);
  v23 = v12;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v22 = v13;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v16, "executeBlockAfterCurrentStateTransition:", v18);

  return CFSTR("Returning post play PiP to fullscreen with playback UI");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(unsigned __int8 *)(a1 + 64);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15;
  v4[3] = &unk_1E9F99840;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v3, v4);

}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Present playlist"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_17;
  v17[3] = &unk_1E9F9D6B8;
  objc_copyWeak(&v22, (id *)(a1 + 40));
  v21 = *(id *)(a1 + 32);
  v13 = v9;
  v18 = v13;
  v14 = v11;
  v19 = v14;
  v15 = v12;
  v20 = v15;
  objc_msgSend(v13, "executeBlockAfterCurrentStateTransition:", v17);

  objc_destroyWeak(&v22);
  return CFSTR("Returning post play PiP to fullscreen without playback UI");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_17(uint64_t a1)
{
  id WeakRetained;
  int v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_msgSend(WeakRetained, "_isNewPostPlayEnabled");

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 56);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_18;
    v5[3] = &unk_1E9F99840;
    v6 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(v4 + 16))(v4, 1, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Present playlist"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Present playlist"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  int v21;
  id WeakRetained;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  char v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id *v42;
  id v43;
  void *v44;
  VUIPlayer *v45;
  void *v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  const char *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  int v85;
  id v86;
  id v87;
  int v88;
  id v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  void *v94;
  uint64_t v95;
  id *v96;
  id v97;
  const __CFString *v98;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  char v105;
  __CFString *v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  int v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  _QWORD block[4];
  id v125;
  id v126;
  id v127;
  id v128;
  BOOL v129;
  char v130;
  _QWORD v131[4];
  id v132;
  _QWORD v133[4];
  id v134;
  uint8_t buf[4];
  void *v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v119 = a2;
  v107 = a3;
  v108 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("PlaylistKey"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("PresentingViewControllerKey"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("DismissalOperationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("AnimatedKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("AllowCellularUsageKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("CompletionKey"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("ExtrasDictionaryKey"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "currentState");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v121;
  if (!objc_msgSend(v121, "isEqualToString:", CFSTR("Showing video full screen")))
  {
    if (objc_msgSend(v121, "isEqualToString:", CFSTR("Showing Extras content")))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(WeakRetained, "extrasPresenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dismissExtrasAnimated:completion:", 0, 0);

LABEL_8:
      v21 = 1;
      v18 = 1.0;
      goto LABEL_9;
    }
    if (objc_msgSend(v121, "isEqualToString:", CFSTR("Showing video full screen with post play content on screen")))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      goto LABEL_22;
    }
    if (objc_msgSend(v121, "isEqualToString:", CFSTR("Returning post play PiP to fullscreen with playback UI")))
    {
      v38 = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(v38, "mainPlayer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "state");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DB1958], "playing");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40 != v41)
        goto LABEL_8;
    }
    else
    {
      if (!objc_msgSend(v121, "isEqualToString:", CFSTR("Returning post play PiP to fullscreen without playback UI")))
      {
        if ((objc_msgSend(v121, "isEqualToString:", CFSTR("Waiting for AVPlayerViewController presentation to complete")) & 1) == 0&& !objc_msgSend(v121, "isEqualToString:", CFSTR("Waiting for AVPlayerViewController presentation to complete to dismiss")))
        {
          v21 = 0;
          goto LABEL_23;
        }
LABEL_22:
        v21 = 1;
LABEL_23:
        v18 = 1.0;
        goto LABEL_10;
      }
      v100 = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(v100, "mainPlayer");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "state");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DB1958], "playing");
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      if (v102 != v103)
        goto LABEL_8;
    }
    v19 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v19, "mainPlayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "rate");
    v18 = v104;
    goto LABEL_4;
  }
  v16 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v16, "extrasPresenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 1.0;
  if (v17)
  {
    v19 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v19, "extrasPresenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dismissExtrasAnimated:completion:", 0, 0);
LABEL_4:

  }
  v21 = 1;
LABEL_9:
  v15 = v121;
LABEL_10:
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("Showing error message without playback UI")))
  {
    v24 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v24, "errorAlertController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(v26, "errorAlertController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "presentingViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "Dismissing error alert controller", buf, 2u);
        }
        v30 = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(v30, "errorAlertController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "dismissViewControllerAnimated:completion:", 0, 0);

      }
      v32 = objc_loadWeakRetained((id *)(a1 + 72));
      objc_msgSend(v32, "setErrorAlertController:", 0);

    }
  }
  if (!v21)
    goto LABEL_33;
  v33 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v33, "avPlayerViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "presentingViewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    v36 = objc_msgSend(v121, "isEqualToString:", CFSTR("Waiting for AVPlayerViewController presentation to complete"));

    if ((v36 & 1) != 0)
      goto LABEL_25;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
      __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19_cold_1();
LABEL_33:
    v117 = 0;
    goto LABEL_34;
  }

LABEL_25:
  v37 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v37, OS_LOG_TYPE_DEFAULT, "Will reuse existing presented AVPlayerViewController", buf, 2u);
  }
  v117 = 1;
LABEL_34:
  v42 = (id *)(a1 + 72);
  v43 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v43, "activePlayer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "preferredAudioLanguageCode");
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v45 = -[VUIPlayer initWithName:]([VUIPlayer alloc], "initWithName:", CFSTR("Main player"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  -[TVPPlayer setReportingCategory:](v45, "setReportingCategory:", CFSTR("fullscreen"));
  -[TVPPlayer setErrorBehavior:](v45, "setErrorBehavior:", 2);
  -[TVPPlayer setAllowsCellularUsage:](v45, "setAllowsCellularUsage:", v14);
  -[TVPPlayer setRateUsedForPlayback:](v45, "setRateUsedForPlayback:", v18);
  objc_msgSend(v9, "objectForKey:", VUIPlaybackManagerPresentPlaylistUserInfoPlaybackContext[0]);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "currentMediaItem");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataPreferredAudioLanguageCode"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v116, "integerValue") == 6)
  {
    v47 = sLogObject_5;
    v48 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
    v49 = v110;
    if (v48)
    {
      *(_DWORD *)buf = 138412290;
      v50 = v110;
      v136 = v110;
      v51 = "Playback context is PostPlayBinge, setting main player's preferred audio language code to value from previous player: %@";
LABEL_40:
      _os_log_impl(&dword_1D96EE000, v47, OS_LOG_TYPE_DEFAULT, v51, buf, 0xCu);
      v49 = v50;
    }
  }
  else
  {
    if (!objc_msgSend(v111, "length"))
      goto LABEL_42;
    v47 = sLogObject_5;
    v52 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
    v49 = v111;
    if (v52)
    {
      *(_DWORD *)buf = 138412290;
      v50 = v111;
      v136 = v111;
      v51 = "Using preferred audio language: %@";
      goto LABEL_40;
    }
  }
  -[TVPPlayer setPreferredAudioLanguageCode:](v45, "setPreferredAudioLanguageCode:", v49);
LABEL_42:
  objc_msgSend(v9, "objectForKey:", VUIPlaybackManagerPresentPlaylistUserInfoIsEligibleForPlayerTabs[0]);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "currentMediaItem");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setMediaItemMetadata:forProperty:", v115, CFSTR("VUIMediaItemMetadataIsEligibleForPlayerTabs"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v54, "BOOLForKey:", CFSTR("RepeatMovieForever")))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "BOOLForKey:", CFSTR("RepeatOneForAllMedia"));

    if (!v56)
      goto LABEL_46;
  }
  objc_msgSend(v123, "setRepeatMode:", 2);
LABEL_46:
  -[TVPPlayer setPlaylist:](v45, "setPlaylist:", v123);
  v57 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v57, "setMainPlayer:", v45);

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "groupActivitiesManager");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "playerDidStart:", v45);

  objc_msgSend(v9, "objectForKey:", VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchId[0]);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchURL[0]);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchMetadata[0]);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v123, "currentMediaItem");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "_updateActivityItemsConfigurationWithSharedWatchId:sharedWatchUrl:previewMetadata:mediaItem:", v114, v113, v112, v61);

  v62 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v62, "setPresentingViewController:", v118);

  v63 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v63, "setDismissalOperation:", v11);

  if (v122)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v120 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v64 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v123, "currentMediaItem");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v64 + 16))(v64, v65);
    v120 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v66 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v120, "setDelegate:", v66);

  v67 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v67, "setExtrasContext:", v120);

  v68 = objc_loadWeakRetained((id *)(a1 + 72));
  v69 = (void *)objc_opt_new();
  objc_msgSend(v68, "setLogoImageDownloader:", v69);

  v70 = (void *)objc_opt_new();
  objc_msgSend(v70, "setPlayer:", v45);
  v71 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v70, "setDelegate:", v71);

  v72 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v72, "setFeatureMonitor:", v70);

  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v73, "setDelegate:", v74);

  v75 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v75, "setPIPedBackgroundMediaController:", 0);

  v76 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v76, "_addPlayerToTimedMetadataManager:", v45);

  v77 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v77, "timedMetadataDebuggerViewController");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "observeCurrentVendor");

  v106 = CFSTR("fullscreen");
  -[TVPPlayer setReportingValueWithString:forKey:](v45, "setReportingValueWithString:forKey:");
  v79 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v79, "avPlayerViewController");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v80)
  {
    v81 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v81, "createPlayerViewController");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v82, "setAvPlayerViewController:", v80);

    v83 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v83, "setMainAVPlayerViewController:", v80);

    if ((v117 & 1) == 0)
    {
      v84 = objc_loadWeakRetained((id *)(a1 + 72));
      v85 = objc_msgSend(v84, "_shouldShowTimedMetadataDebugger");

      if (v85)
      {
        v86 = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(v86, "_addTimedMetadataDebuggerView");

      }
      v87 = objc_loadWeakRetained((id *)(a1 + 72));
      v88 = objc_msgSend(v87, "_shouldShowPerformanceDebugger");

      if (v88)
      {
        v89 = objc_loadWeakRetained((id *)(a1 + 72));
        objc_msgSend(v89, "_addPerformanceDebuggerView");

      }
    }
  }
  v90 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v123, "currentMediaItem");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "_donateUserActivityForMediaItem:", v91);

  v92 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v92, "_updateRequiresLinearPlayback");

  v93 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v93, "stateMachine");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = MEMORY[0x1E0C809B0];
  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v133[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_760;
  v133[3] = &unk_1E9F99C98;
  objc_copyWeak(&v134, v42);
  objc_msgSend(v94, "executeBlockAfterCurrentStateTransition:", v133);

  if (!v117)
  {
    block[0] = v95;
    block[1] = 3221225472;
    block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_768;
    block[3] = &unk_1E9F9D6E0;
    v96 = &v128;
    objc_copyWeak(&v128, v42);
    v127 = v109;
    v129 = v122 != 0;
    v125 = v118;
    v126 = v80;
    v130 = v105;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    goto LABEL_60;
  }
  v131[0] = v95;
  v131[1] = 3221225472;
  v131[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_767;
  v131[3] = &unk_1E9F99C98;
  v96 = &v132;
  objc_copyWeak(&v132, v42);
  objc_msgSend(v119, "executeBlockAfterCurrentStateTransition:", v131);
  if ((objc_msgSend(v121, "isEqualToString:", CFSTR("Waiting for AVPlayerViewController presentation to complete")) & 1) != 0)
  {
LABEL_60:
    v98 = CFSTR("Waiting for AVPlayerViewController presentation to complete");
    goto LABEL_61;
  }
  if (objc_msgSend(v121, "isEqualToString:", CFSTR("Waiting for AVPlayerViewController presentation to complete to dismiss")))
  {
    v97 = objc_loadWeakRetained(v42);
    objc_msgSend(v97, "performSelector:withObject:afterDelay:", sel__avPlayerViewControllerPresentationDidTimeout, 0, 5.0);

    goto LABEL_60;
  }
  if (objc_msgSend(v121, "isEqualToString:", CFSTR("Returning post play PiP to fullscreen without playback UI")))v98 = CFSTR("Waiting for playback to start to return to fullscreen");
  else
    v98 = CFSTR("Showing video full screen");
LABEL_61:
  objc_destroyWeak(v96);
  objc_destroyWeak(&v134);

  return v98;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_760(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mainPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEndEventWithName:", *MEMORY[0x1E0DB1F28]);

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "mainPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActivePlayer:", v7);

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupActivitiesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v9, "isSessionActive");

  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DC6AF8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11 || (objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v11, "BOOLValue") & 1) != 0)
      goto LABEL_10;
    v12 = objc_msgSend(v11, "BOOLValue");
    v13 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CFSTR("paused");
      if (v12)
        v14 = CFSTR("playing");
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Overriding initial playback state to %@ per user default", buf, 0xCu);
    }
    if (!v12)
    {
      v19 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "GroupActivities session is active, starting in paused state", buf, 2u);
      }
      v16 = objc_loadWeakRetained(v1);
      objc_msgSend(v16, "mainPlayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pause");
    }
    else
    {
LABEL_10:
      v15 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "GroupActivities session is active, starting in playing state", buf, 2u);
      }
      v16 = objc_loadWeakRetained(v1);
      objc_msgSend(v16, "mainPlayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "play");
    }

  }
  else
  {
    v20 = objc_loadWeakRetained(v1);
    objc_msgSend(v20, "mainPlayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "play");

  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_767(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "extrasContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startIfNecessary");

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_768(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  id WeakRetained;
  id v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  char v37;

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_769;
  aBlock[3] = &unk_1E9F9BFE8;
  v3 = (id *)(a1 + 56);
  objc_copyWeak(&v36, (id *)(a1 + 56));
  v35 = *(id *)(a1 + 48);
  v37 = *(_BYTE *)(a1 + 64);
  v4 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "performSelector:withObject:afterDelay:", sel__avPlayerViewControllerPresentationDidTimeout, 0, 5.0);

  v6 = objc_loadWeakRetained(v3);
  v7 = objc_msgSend(v6, "_isNewPostPlayEnabled");

  if (v7)
  {
    v8 = objc_loadWeakRetained(v3);
    objc_msgSend(v8, "playbackContainerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "documentCreator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playbackContainerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_loadWeakRetained(v3);
      objc_msgSend(v12, "setDelegate:", v13);

      objc_msgSend(v12, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBackgroundColor:", v15);

      v16 = objc_loadWeakRetained(v3);
      objc_msgSend(v16, "setPlaybackContainerViewController:", v12);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_1F0283FC8))
    {
      v17 = *(id *)(a1 + 32);
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "documentCreator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "recordImpressionsForViewController:", v20);

    }
    else
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "documentCreator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "recordImpressionsForViewController:", *(_QWORD *)(a1 + 32));
    }

    v21 = objc_loadWeakRetained(v3);
    objc_msgSend(v21, "playbackContainerViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "presentingViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = objc_loadWeakRetained(v3);
      objc_msgSend(v24, "playbackContainerViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_loadWeakRetained(v3);
      objc_msgSend(v26, "avPlayerViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "presentPlayerViewController:animated:completion:", v27, 0, v4);

    }
    else
    {
      v28 = *(void **)(a1 + 32);
      v29 = objc_loadWeakRetained(v3);
      objc_msgSend(v29, "playbackContainerViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v2;
      v31[1] = 3221225472;
      v31[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_778;
      v31[3] = &unk_1E9F9A060;
      objc_copyWeak(&v33, v3);
      v32 = v4;
      objc_msgSend(v28, "presentViewController:animated:completion:", v30, 1, v31);

      objc_destroyWeak(&v33);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 65), v4);
  }

  objc_destroyWeak(&v36);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_769(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DE7910];
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "cancelPreviousPerformRequestsWithTarget:selector:object:", WeakRetained, sel__avPlayerViewControllerPresentationDidTimeout, 0);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("IsTestingITunesExtrasKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("AVPlayerViewController presentation did complete"), 0, v9);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_778(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "avPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentPlayerViewController:animated:completion:", v5, 0, *(_QWORD *)(a1 + 32));

}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_779(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  __CFString *v18;
  void *v19;
  dispatch_time_t v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKey:", CFSTR("PlaylistKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentMediaItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0DB1DC8]) & 1) != 0
    || (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0DB1DE0]) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "stateMachine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_781;
    v24[3] = &unk_1E9F9A938;
    objc_copyWeak(&v26, (id *)(a1 + 40));
    v25 = v13;
    objc_msgSend(v17, "executeBlockAfterCurrentStateTransition:", v24);

    objc_msgSend(v9, "currentState");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v26);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(v12, "objectForKey:", VUIPlaybackManagerPresentPlaylistUserInfoPlaybackContext[0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "unsignedIntegerValue") == 5)
    {
      v20 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_780;
      block[3] = &unk_1E9F99000;
      objc_copyWeak(&v30, (id *)(a1 + 40));
      v28 = v11;
      v29 = v12;
      dispatch_after(v20, MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v30);
    }
    else
    {
      v21 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v21, "stateMachine");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postEvent:withContext:userInfo:", CFSTR("Present playlist"), v11, v12);

    }
    v18 = CFSTR("Showing video full screen");
  }

  return v18;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_780(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Present playlist"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_781(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "extrasNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 32);
  if (v6 && v5)
  {
    v10[0] = CFSTR("PlaylistKey");
    v10[1] = CFSTR("PresentingViewControllerKey");
    v11[0] = v6;
    v11[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postEvent:withContext:userInfo:", CFSTR("Extras playback requested"), 0, v7);

  }
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_782(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  __CFString *v60;
  __CFString *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void (**v72)(void);
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76[2];

  v70 = a2;
  v69 = a3;
  v68 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("CompletionKey"));
  v72 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("PlayerKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playlist");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("PlaybackContainerKey"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = (void *)v12;
  if ((void *)v12 != v15)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v10, "setReportingCategory:", CFSTR("fullscreen"));
  objc_msgSend(v10, "setErrorBehavior:", 2);
  objc_msgSend(v10, "setAllowsCellularUsage:", 0);
  objc_msgSend(v10, "setAllowsExternalPlayback:", 1);
  objc_msgSend(v9, "objectForKey:", VUIPlaybackManagerPresentPlaylistUserInfoIsEligibleForPlayerTabs[0]);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentMediaItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)v16;
  objc_msgSend(v17, "setMediaItemMetadata:forProperty:", v16, CFSTR("VUIMediaItemMetadataIsEligibleForPlayerTabs"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "BOOLForKey:", CFSTR("RepeatMovieForever")))
  {

LABEL_6:
    objc_msgSend(v11, "setRepeatMode:", 2);
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLForKey:", CFSTR("RepeatOneForAllMedia"));

  if (v20)
    goto LABEL_6;
LABEL_7:
  v21 = objc_loadWeakRetained(v13);
  objc_msgSend(v21, "setMainPlayer:", v10);

  v22 = objc_loadWeakRetained(v13);
  objc_msgSend(v22, "setActivePlayer:", v10);

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "groupActivitiesManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "playerDidStart:", v10);

  objc_msgSend(v9, "objectForKey:", VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchId[0]);
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchURL[0]);
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchMetadata[0]);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = objc_loadWeakRetained(v13);
  objc_msgSend(v11, "currentMediaItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)v26;
  v65 = (void *)v25;
  v63 = (void *)v27;
  objc_msgSend(v28, "_updateActivityItemsConfigurationWithSharedWatchId:sharedWatchUrl:previewMetadata:mediaItem:", v25, v26, v27, v29);

  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "setPlayer:", v10);
  v31 = objc_loadWeakRetained(v13);
  objc_msgSend(v30, "setDelegate:", v31);

  v32 = objc_loadWeakRetained(v13);
  objc_msgSend(v32, "setFeatureMonitor:", v30);

  objc_msgSend(v9, "objectForKey:", CFSTR("PlayerViewControllerKey"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_loadWeakRetained(v13);
  objc_msgSend(v34, "setAvPlayerViewController:", v33);

  v35 = objc_loadWeakRetained(v13);
  objc_msgSend(v35, "setMainAVPlayerViewController:", v33);

  v36 = objc_loadWeakRetained(v13);
  objc_msgSend(v36, "_setupPlayerViewController:", v33);

  v37 = objc_loadWeakRetained(v13);
  objc_msgSend(v37, "_currentlyPlayingMultiviewInfo");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = objc_loadWeakRetained(v13);
    objc_msgSend(v39, "multiviewPlaybackInfo");
    v40 = v11;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "indexOfObject:", v38);

    v11 = v40;
    if (v42 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v43 = objc_loadWeakRetained(v13);
      objc_msgSend(v43, "multiPlayerViewController");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "replacePlayerViewController:atIndex:animated:completion:", v33, v42, 0, 0);

      v11 = v40;
      objc_msgSend(v38, "setPlayer:", v10);
      objc_msgSend(v38, "setPlayerViewController:", v33);
    }
  }
  v45 = objc_loadWeakRetained(v13);
  objc_msgSend(v71, "setDelegate:", v45);

  v46 = objc_loadWeakRetained(v13);
  objc_msgSend(v46, "setPlaybackContainerViewController:", v71);

  v47 = objc_loadWeakRetained(v13);
  objc_msgSend(v71, "presentingViewController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setPresentingViewController:", v48);

  v49 = objc_loadWeakRetained(v13);
  v67 = v11;
  objc_msgSend(v11, "currentMediaItem");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "_donateUserActivityForMediaItem:", v50);

  v51 = objc_loadWeakRetained(v13);
  objc_msgSend(v51, "_updateRequiresLinearPlayback");

  v52 = objc_loadWeakRetained(v13);
  objc_msgSend(v52, "stateMachine");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_783;
  v75[3] = &unk_1E9F99C98;
  objc_copyWeak(v76, v13);
  objc_msgSend(v53, "executeBlockAfterCurrentStateTransition:", v75);

  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_loadWeakRetained(v13);
  objc_msgSend(v54, "setDelegate:", v55);

  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v55) = objc_msgSend(v56, "isPlayerTabsEnabled");

  if ((_DWORD)v55)
  {
    +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_784;
    v73[3] = &unk_1E9F99C98;
    objc_copyWeak(&v74, v13);
    objc_msgSend(v57, "updatePlayerTabsExcludingCanonicals:completion:", 0, v73);

    objc_destroyWeak(&v74);
  }
  if (v72)
    v72[2]();
  v58 = objc_loadWeakRetained(v13);
  objc_msgSend(v58, "multiPlayerViewController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
    v60 = CFSTR("Showing multiview playback fullscreen");
  else
    v60 = CFSTR("Showing video full screen");
  v61 = v60;

  objc_destroyWeak(v76);
  return v61;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_783(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mainPlayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentMediaItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEndEventWithName:", *MEMORY[0x1E0DB1F28]);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_784(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setupInfoTab");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_updateMultiviewButtonState");

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_785(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a5;
  objc_msgSend(v6, "objectForKey:", CFSTR("CompletionKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("PlaylistsKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("PresentingViewControllerKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return CFSTR("Showing multiview playback");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_786(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;

  objc_msgSend(a5, "objectForKey:", CFSTR("CompletionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return CFSTR("Showing multiview playback");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_787(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v15 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "avPlayerViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);

  objc_msgSend(WeakRetained, "avPlayerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "multiPlayerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "conformsToProtocol:", &unk_1F02CBB78);

  if (v19)
  {
    objc_msgSend(WeakRetained, "multiPlayerViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v20);

  }
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "multiPlayerViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "embedMultiPlayerViewController:", v22);

  objc_msgSend(WeakRetained, "multiPlayerViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_14_838;
  v30 = &unk_1E9F9B6C0;
  v24 = v17;
  v31 = v24;
  objc_copyWeak(&v32, v13);
  objc_msgSend(v23, "exitFullscreenWithCompletion:", &v27);

  v25 = objc_loadWeakRetained(v13);
  objc_msgSend(v25, "configureAudioSessionForBackgroundPlayback:usingPlaybackCategory:isMultiview:", 0, 0, 1, v27, v28, v29, v30);

  objc_destroyWeak(&v32);
  return CFSTR("Showing multiview playback");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_14_838(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "setDelegate:", WeakRetained);

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15_839(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  id WeakRetained;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD);
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  void (**v39)(_QWORD);
  _QWORD aBlock[4];
  id v41;
  id v42;
  id v43[2];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKey:", CFSTR("CompletionKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PlayerViewControllerKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v34 = v11;
    v35 = v10;
    v15 = v13;
    v16 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v14, "setDelegate:", WeakRetained);

    v18 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v18, "_multiviewInfoForPlayerViewController:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "player");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAllowsExternalPlayback:", 1);
    objc_msgSend(v14, "setUpdatesNowPlayingInfoCenter:", 1);
    objc_msgSend(v14, "setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:", 2);
    v21 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v21, "setActivePlayer:", v20);

    v22 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v22, "setMainPlayer:", v20);

    v23 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v23, "setMainAVPlayerViewController:", v14);

    v24 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v24, "setAvPlayerViewController:", v14);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_16_840;
    aBlock[3] = &unk_1E9F99600;
    objc_copyWeak(v43, (id *)(a1 + 40));
    v25 = v19;
    v41 = v25;
    v33 = v15;
    v42 = v15;
    v26 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v9, "currentState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = objc_msgSend(v27, "isEqualToString:", CFSTR("Showing multiview playback"));

    if ((_DWORD)v24)
    {
      v28 = objc_loadWeakRetained(v16);
      objc_msgSend(v28, "playbackContainerViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_17_841;
      v38[3] = &unk_1E9F98E68;
      v39 = v26;
      objc_msgSend(v29, "presentPlayerViewController:animated:completion:", v14, 1, v38);

    }
    else
    {
      v26[2](v26);
    }

    objc_destroyWeak(v43);
    v31 = CFSTR("Showing video full screen");
    v11 = v34;
    v10 = v35;
    v13 = v33;
  }
  else
  {
    v30 = *(_QWORD *)(a1 + 32);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_18_842;
    v36[3] = &unk_1E9F99C98;
    objc_copyWeak(&v37, (id *)(a1 + 40));
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD *))(v30 + 16))(v30, 1, 1, 0, 1, 0, 0, v36);
    objc_destroyWeak(&v37);
    v31 = CFSTR("Not showing anything");
  }

  return v31;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_16_840(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t result;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "multiviewPlaybackInfo", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        if (v9 != *(void **)(a1 + 32))
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v8), "player");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stop");

          objc_msgSend(v9, "player");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "invalidate");

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "multiviewPlaybackInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  v14 = objc_loadWeakRetained(v2);
  objc_msgSend(v14, "playbackContainerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "unembedMultiPlayerViewController");

  v17 = objc_loadWeakRetained(v2);
  objc_msgSend(v17, "setMultiPlayerViewController:", 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_17_841(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_18_842(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMultiPlayerViewController:", 0);

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19_843(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  VUIPlaybackStartupCoordinator *v22;
  VUIPlaybackStartupCoordinator *v23;
  id v24;
  id v25;
  id v26;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  VUIPlaybackStartupCoordinator *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  char v37;

  v30 = a2;
  v29 = a3;
  v28 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("PlaylistKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "vui_BOOLForKey:defaultValue:", CFSTR("AnimatedKey"), 1);
  objc_msgSend(v9, "vui_numberForKey:", CFSTR("IndexKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("CompletionKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v15);
  objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v12)
    objc_msgSend(v17, "insertObject:atIndex:", v14, objc_msgSend(v12, "integerValue"));
  else
    objc_msgSend(v17, "addObject:", v14);

  v19 = objc_loadWeakRetained(v15);
  objc_msgSend(v19, "_updateMultiviewReportingMetrics");

  objc_msgSend(v10, "currentMediaItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[VUIPlaybackStartupCoordinator initWithCanonicalID:showCanonicalID:mediaType:watchType:isRentAndWatchNow:]([VUIPlaybackStartupCoordinator alloc], "initWithCanonicalID:showCanonicalID:mediaType:watchType:isRentAndWatchNow:", v21, 0, CFSTR("SportingEvent"), 2, 0);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_20;
  v31[3] = &unk_1E9F9D758;
  v23 = v22;
  v32 = v23;
  objc_copyWeak(&v36, v15);
  v24 = v14;
  v33 = v24;
  v37 = v11;
  v25 = v13;
  v35 = v25;
  v26 = v12;
  v34 = v26;
  -[VUIPlaybackStartupCoordinator performPlaybackStartupFlowWithCompletion:](v23, "performPlaybackStartupFlowWithCompletion:", v31);

  objc_destroyWeak(&v36);
  return CFSTR("Showing multiview playback");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_20(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v4 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v6 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "multiPlayerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 72);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_21;
    v16[3] = &unk_1E9F98E68;
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v7, "addPlayerViewController:animated:completion:", v8, v9, v16);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    v11 = objc_loadWeakRetained(v4);
    objc_msgSend(v11, "multiviewPlaybackInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
      objc_msgSend(v12, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 48), "integerValue"));
    else
      objc_msgSend(v12, "removeLastObject");

    v14 = objc_loadWeakRetained(v4);
    objc_msgSend(v14, "_updateMultiviewReportingMetrics");

    v15 = *(_QWORD *)(a1 + 56);
    if (v15)
      (*(void (**)(uint64_t, _QWORD))(v15 + 16))(v15, 0);
  }

}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_21(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_22(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "avPlayerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "multiPlayerViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "conformsToProtocol:", &unk_1F02CBB78);

  if (v17)
  {
    objc_msgSend(WeakRetained, "multiPlayerViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v18);

  }
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "multiPlayerViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "embedMultiPlayerViewController:", v20);

  objc_msgSend(WeakRetained, "setActivePlayer:", 0);
  objc_msgSend(WeakRetained, "setMainPlayer:", 0);
  objc_msgSend(WeakRetained, "setMainAVPlayerViewController:", 0);
  objc_msgSend(WeakRetained, "setAvPlayerViewController:", 0);
  objc_msgSend(WeakRetained, "multiPlayerViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_23;
  v26[3] = &unk_1E9F9D780;
  v22 = v15;
  v27 = v22;
  objc_copyWeak(&v30, v13);
  v23 = v9;
  v28 = v23;
  v24 = v12;
  v29 = v24;
  objc_msgSend(v21, "exitFullscreenWithCompletion:", v26);

  objc_destroyWeak(&v30);
  return CFSTR("Showing multiview playback");
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_23(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v2, "setDelegate:", WeakRetained);

  return objc_msgSend(*(id *)(a1 + 40), "postEvent:withContext:userInfo:", CFSTR("Add multiview playback"), 0, *(_QWORD *)(a1 + 48));
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(v6, "objectForKey:", CFSTR("CompletionKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("PlaylistKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *))(v9 + 16))(v9, 0, v10, v7);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, v7);
  }

  return CFSTR("Showing multiview playback");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = (id *)(a1 + 32);
  v6 = a5;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(v6, "objectForKey:", CFSTR("PlaylistKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "vui_BOOLForKey:defaultValue:", CFSTR("AnimatedKey"), 1);

  objc_msgSend(v8, "currentMediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A08]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained(v5);
  v13 = objc_msgSend(v12, "indexOfMediaItemInMultiviewWithIdentifier:", v11);

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v13 < v15)
    {
      objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "multiPlayerViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "playerViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removePlayerViewController:animated:completion:", v19, v9, 0);

      objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObject:", v17);

      objc_msgSend(v17, "player");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stop");

      objc_msgSend(v17, "player");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "invalidate");

      v23 = objc_loadWeakRetained(v5);
      objc_msgSend(v23, "_updateMultiviewReportingMetrics");

    }
  }
  objc_msgSend(WeakRetained, "_unmuteNextAvailableMultiviewPlayer");

  return CFSTR("Showing multiview playback");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_26(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = (id *)(a1 + 40);
  v7 = a5;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v7, "objectForKey:", CFSTR("PlaylistKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "vui_BOOLForKey:defaultValue:", CFSTR("AnimatedKey"), 1);
  objc_msgSend(v7, "vui_numberForKey:", CFSTR("IndexKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "integerValue");
  objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "multiviewPlaybackInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:atIndexedSubscript:", v15, v12);

  objc_msgSend(WeakRetained, "multiPlayerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "replacePlayerViewController:atIndex:animated:completion:", v18, v12, v10, 0);

  objc_msgSend(v15, "playerViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_muteAllMultiviewPlayersExcept:", v19);

  objc_msgSend(v14, "player");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stop");

  objc_msgSend(v14, "player");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "invalidate");

  return CFSTR("Showing multiview playback");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id WeakRetained;
  id v8;
  void *v9;

  objc_msgSend(a5, "objectForKey:", CFSTR("PlayerViewControllerKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_muteAllMultiviewPlayersExcept:", v6);

  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v8, "_multiviewInfoForPlayerViewController:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "pausedDueToInterruption"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return CFSTR("Showing multiview playback");
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_28(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  id v43;
  __CFString *v44;
  __CFString *v45;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;

  v9 = a2;
  v48 = a3;
  v47 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("PlayerViewControllerKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_multiviewInfoForPlayerViewController:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setContext:", 2);
  objc_msgSend(v14, "player");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsExternalPlayback:", 1);

  objc_msgSend(v11, "setUpdatesNowPlayingInfoCenter:", 1);
  v16 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v14, "player");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActivePlayer:", v17);

  v18 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v14, "player");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMainPlayer:", v19);

  v20 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v20, "setAvPlayerViewController:", v11);

  v21 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v21, "setMainAVPlayerViewController:", v11);

  v22 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v22, "mainPlayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentMediaItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_showShareMediaMenuForMediaItem:", v24);

  v25 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v25, "_muteAllMultiviewPlayersExcept:", v11);

  objc_msgSend(v11, "setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:", 2);
  v26 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_29;
  v51[3] = &unk_1E9F99420;
  v53 = *(id *)(a1 + 32);
  v27 = v11;
  v52 = v27;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v51);
  +[VUIPlaybackTabManager sharedInstance](VUIPlaybackTabManager, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_loadWeakRetained(v12);
  objc_msgSend(v29, "multiviewIdentifiers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v26;
  v49[1] = 3221225472;
  v49[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_30;
  v49[3] = &unk_1E9F99C98;
  objc_copyWeak(&v50, v12);
  objc_msgSend(v28, "updatePlayerTabsExcludingCanonicals:completion:", v30, v49);

  v31 = objc_loadWeakRetained(v12);
  objc_msgSend(v27, "setDelegate:", v31);

  v32 = objc_loadWeakRetained(v12);
  objc_msgSend(v32, "playbackContainerViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (id)objc_msgSend(v33, "unembedMultiPlayerViewController");

  objc_msgSend(v27, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "window");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v38 = v37;
  v40 = v39;

  v41 = objc_loadWeakRetained(v12);
  objc_msgSend(v41, "multiPlayerViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = objc_msgSend(v42, "isSupportedScreenSize:", v38, v40);

  v43 = objc_loadWeakRetained(v12);
  objc_msgSend(v43, "configureAudioSessionForBackgroundPlayback:usingPlaybackCategory:isMultiview:", 0, 0, 0);

  if ((_DWORD)v36)
    v44 = CFSTR("Showing multiview playback fullscreen");
  else
    v44 = CFSTR("Showing multiview playback fullscreen due to small screen size");
  v45 = v44;
  objc_destroyWeak(&v50);

  return v45;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_30(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateMultiviewButtonState");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_setupInfoTab");

}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_31(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v33;
  char v34;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46[2];

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "objectForKey:", CFSTR("PlaylistKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("CanPlayMediaKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v15 = objc_msgSend(v13, "BOOLValue") ^ 1;
  else
    LOBYTE(v15) = 1;
  v34 = v15;
  objc_msgSend(v12, "tvpPlaylist");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentMediaItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v14;
  if ((objc_msgSend(v17, "hasTrait:", VUIMediaItemTraitIsSportingEvent) & 1) != 0)
  {
    objc_msgSend(v12, "videosPlayables");
    v33 = v12;
    v18 = v11;
    v19 = v8;
    v20 = v10;
    v21 = v9;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "duration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v21;
    v10 = v20;
    v8 = v19;
    v11 = v18;
    v12 = v33;

    if (!v25)
      goto LABEL_10;
  }
  else
  {

  }
  objc_msgSend(v8, "currentState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("Showing multiview playback fullscreen"));

  if (v27)
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_32;
    v43[3] = &unk_1E9F99000;
    objc_copyWeak(v46, (id *)(a1 + 40));
    v44 = v11;
    v45 = v10;
    objc_msgSend(v8, "executeBlockAfterCurrentStateTransition:", v43);

    objc_destroyWeak(v46);
    goto LABEL_15;
  }
LABEL_10:
  if ((v34 & 1) == 0)
  {
    if (objc_msgSend(v12, "playbackContext") == 7)
      v28 = 4;
    else
      v28 = 3;
    +[VUIPlaybackStartupCoordinator startupCoordinatorWithMediaInfo:watchType:isRentAndWatchNow:](VUIPlaybackStartupCoordinator, "startupCoordinatorWithMediaInfo:watchType:isRentAndWatchNow:", v12, v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_33;
    v37[3] = &unk_1E9F9D7A8;
    v30 = v29;
    v38 = v30;
    objc_copyWeak(&v42, (id *)(a1 + 40));
    v41 = *(id *)(a1 + 32);
    v39 = v12;
    v40 = v8;
    objc_msgSend(v30, "performPlaybackStartupFlowWithCompletion:", v37);

    objc_destroyWeak(&v42);
  }
LABEL_15:
  objc_msgSend(v8, "currentState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_32(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Dismiss multiview playback"), 0, *(_QWORD *)(a1 + 32));

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Media info did change"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_33(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, void *a6, void *a7, void *a8)
{
  id v15;
  id v16;
  NSObject *v17;
  id WeakRetained;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v39 = a6;
  v15 = a7;
  v16 = a8;
  v17 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v44 = a2;
    v45 = 2048;
    v46 = a3;
    v47 = 2048;
    v48 = a4;
    v49 = 2048;
    v50 = a5;
    _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Mediainfo changed startup coordinator finished startup flow.  startPlayback == %ld, isCoWatching == %ld, forceDownloadToStream == %ld, allowCellular == %ld", buf, 0x2Au);
  }
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "_setExtrasButtonVisible:", 0, v39);

    v19 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "tvpPlaylist");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "currentMediaItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v22, "setDelegate:", v23);

    v24 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v24, "setExtrasContext:", v22);

    v25 = *(void **)(a1 + 48);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_846;
    v41[3] = &unk_1E9F99C98;
    objc_copyWeak(&v42, (id *)(a1 + 64));
    objc_msgSend(v25, "executeBlockAfterCurrentStateTransition:", v41);
    objc_msgSend(*(id *)(a1 + 40), "tvpPlaylist");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "currentMediaItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addEndEventWithName:", *MEMORY[0x1E0DB1F28]);

    v29 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v29, "mainPlayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "tvpPlaylist");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPlaylist:", v31);

    objc_msgSend(v30, "currentMediaItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMetricsMediaEvent recordPlayOfTVPMediaItem:](VUIMetricsMediaEvent, "recordPlayOfTVPMediaItem:", v32);

    objc_msgSend(v30, "play");
    v33 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v15, "sharedWatchId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sharedWatchUrl");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "playlist");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "currentMediaItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_updateActivityItemsConfigurationWithSharedWatchId:sharedWatchUrl:previewMetadata:mediaItem:", v34, v35, v16, v37);

    objc_destroyWeak(&v42);
  }
  else
  {
    v38 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "Not playing media item after media info changed since playback startup coordinator disallowed it", buf, 2u);
    }
    v22 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v22, "_clearActivityItemsConfiguration", v39);
  }

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_846(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "extrasContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startIfNecessary");

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_847(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id WeakRetained;
  id v8;
  id v9;

  objc_msgSend(a5, "objectForKey:", CFSTR("PlayerViewControllerKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "setDelegate:", WeakRetained);

  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v8, "configureAudioSessionForBackgroundPlayback:usingPlaybackCategory:isMultiview:", 0, 0, 1);

  v9 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v9, "_muteAllMultiviewPlayersExcept:", v6);

  objc_msgSend(v6, "setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:", 4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return CFSTR("Showing multiview playback");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_848(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("AnimatedKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v8, "objectForKey:", CFSTR("CompletionKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "currentState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "isEqualToString:", CFSTR("Showing error message on playback UI"));

  objc_msgSend(v7, "currentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Showing video full screen with post play content on screen")) & 1) == 0)
  {
    objc_msgSend(v7, "currentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "isEqualToString:", CFSTR("Showing post play content without playback UI"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return CFSTR("Not showing anything");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_849(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  void *v6;

  objc_msgSend(a5, "objectForKey:", CFSTR("CompletionKey"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t))(v5 + 16))(v5);

  return CFSTR("Waiting for AVPlayerViewController presentation to complete to dismiss");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_851(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  objc_msgSend(v6, "objectForKey:", CFSTR("AnimatedKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("CompletionKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return CFSTR("Not showing anything");
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_852(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKey:", CFSTR("CompletionKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_853;
  v20 = &unk_1E9F9A060;
  objc_copyWeak(&v22, (id *)(a1 + 32));
  v14 = v13;
  v21 = v14;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", &v17);
  objc_msgSend(v9, "currentState", v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v22);
  return v15;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_853(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setPIPedBackgroundMediaController:", 0);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  objc_msgSend(v6, "objectForKey:", CFSTR("AnimatedKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("CompletionKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return CFSTR("Not showing anything");
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_855(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v7 = a2;
  v8 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("AnimatedKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v8, "objectForKey:", CFSTR("CompletionKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
  {
    v11 = CFSTR("Showing extras video picture in picture outside extras content");
  }
  else
  {
    objc_msgSend(v7, "currentState");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_856(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  id v47;
  id v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  uint8_t buf[16];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "savedErrorContext");
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v16, "savedErrorUserInfo");
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", CFSTR("IsTestingITunesExtrasKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  v49 = (void *)v15;
  if (v15 | v17)
  {
    v20 = v12;
    v21 = v11;
    v22 = v9;
    v23 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v23, OS_LOG_TYPE_DEFAULT, "An error occurred while the main AVPlayerViewController was being presented.  Posting error event again.", buf, 2u);
    }
    v24 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v24, "setSavedErrorContext:", 0);

    v25 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v25, "setSavedErrorUserInfo:", 0);

    v26 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v26, "stateMachine");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_857;
    v54[3] = &unk_1E9F99000;
    objc_copyWeak(&v57, v13);
    v28 = v49;
    v55 = v49;
    v56 = (id)v17;
    objc_msgSend(v27, "executeBlockAfterCurrentStateTransition:", v54);

    objc_destroyWeak(&v57);
    v29 = CFSTR("Showing video full screen");
  }
  else
  {
    v47 = v11;
    v48 = v9;
    v30 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v30, "mainPlayer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "state");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 != v33)
      v19 = 1;

    if ((v19 & 1) != 0)
    {
      v34 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v34, "stateMachine");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_859;
      v50[3] = &unk_1E9F99C98;
      objc_copyWeak(&v51, v13);
      objc_msgSend(v35, "executeBlockAfterCurrentStateTransition:", v50);

      v36 = objc_loadWeakRetained(v13);
      objc_msgSend(v36, "mainPlayer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "state");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DB1958], "playing");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38 == v39)
      {
        v40 = objc_loadWeakRetained(v13);
        objc_msgSend(v40, "mainPlayer");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "currentMediaItem");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "_showShareMediaMenuForMediaItem:", v42);

      }
      v20 = v12;
      objc_destroyWeak(&v51);
      v29 = CFSTR("Showing video full screen");
    }
    else
    {
      v20 = v12;
      v43 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v43, OS_LOG_TYPE_DEFAULT, "Dismissing main AVPlayerViewController since playback has stopped since being presented", buf, 2u);
      }
      v44 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v44, "stateMachine");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_858;
      v52[3] = &unk_1E9F98E68;
      v53 = *(id *)(a1 + 32);
      objc_msgSend(v45, "executeBlockAfterCurrentStateTransition:", v52);

      v29 = CFSTR("Not showing anything");
    }
    v22 = v48;
    v21 = v47;
    v28 = v49;
  }

  return v29;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_857(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Error did occur"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_858(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_859(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "extrasContext");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startIfNecessary");

}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_860(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  __CFString *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint8_t buf[16];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "savedErrorContext");
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v16, "savedErrorUserInfo");
  v17 = objc_claimAutoreleasedReturnValue();

  if (v15 | v17)
  {
    v18 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "An error occurred while the extras AVPlayerViewController was being presented.  Posting error event again.", buf, 2u);
    }
    v19 = objc_loadWeakRetained(v13);
    objc_msgSend(v19, "setSavedErrorContext:", 0);

    v20 = objc_loadWeakRetained(v13);
    objc_msgSend(v20, "setSavedErrorUserInfo:", 0);

    v21 = objc_loadWeakRetained(v13);
    objc_msgSend(v21, "stateMachine");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_861;
    v34[3] = &unk_1E9F99000;
    objc_copyWeak(&v37, v13);
    v35 = (id)v15;
    v36 = (id)v17;
    objc_msgSend(v22, "executeBlockAfterCurrentStateTransition:", v34);

    objc_destroyWeak(&v37);
    v23 = CFSTR("Showing video full screen");
  }
  else
  {
    v33 = v12;
    v24 = v11;
    v25 = v10;
    v26 = v9;
    v27 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v27, "extrasPlayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "state");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29 == v30)
    {
      v31 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_DEFAULT, "Dismissing extras AVPlayerViewController because playback has stopped since being presented", buf, 2u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("Showing video full screen");
    }
    v9 = v26;
    v10 = v25;
    v11 = v24;
    v12 = v33;
  }

  return v23;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_861(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Error did occur"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_862(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_863;
  v5[3] = &unk_1E9F98E68;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v5);

  return CFSTR("Not showing anything");
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_863(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_864(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_865;
  v4[3] = &unk_1E9F98E68;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "executeBlockAfterCurrentStateTransition:", v4);

  return CFSTR("Not showing anything");
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_865(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_866(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_867;
  v4[3] = &unk_1E9F98E68;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "executeBlockAfterCurrentStateTransition:", v4);

  return CFSTR("Not showing anything");
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_867(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_868(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  __CFString *v11;

  v3 = a2;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "_resetAutoPlayBingeWatchingQualifications");

  v5 = objc_loadWeakRetained(a1);
  objc_msgSend(v5, "avPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(a1);
  objc_msgSend(v7, "extrasAVPlayerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
  {
    v11 = CFSTR("Showing extras video picture in picture on extras content");
  }
  else
  {
    objc_msgSend(v3, "currentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Showing video full screen"));

    if ((v10 & 1) != 0)
    {
      v11 = CFSTR("Showing main video picture in picture");
    }
    else
    {
      objc_msgSend(v3, "currentState");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v11;
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_869(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("PlayerViewControllerKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "_multiviewInfoForPlayerViewController:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContext:", 3);
  v9 = objc_loadWeakRetained(a1);
  objc_msgSend(v9, "_resetAutoPlayBingeWatchingQualifications");

  return CFSTR("Showing multiview playback in PIP");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_870(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_pushMoreInfoControllerIfNeeded");

  return CFSTR("Showing extras video picture in picture outside extras content");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_871(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return CFSTR("Showing main video picture in picture");
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_872(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;

  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setDismissalOperation:", 2);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PlayerViewControllerKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v11, "setAvPlayerViewController:", v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v12 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v12, "_pushMoreInfoControllerIfNeeded");

  objc_msgSend(v7, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Showing multiview playback fullscreen")) & 1) != 0)
  {
    v14 = CFSTR("Showing multiview playback fullscreen in PIP");
  }
  else
  {
    objc_msgSend(v7, "currentState");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_873(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, _QWORD);
  id v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16);
  v4 = a2;
  v3(v2, 1, 0);
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  id v12;

  v6 = (id *)(a1 + 40);
  v7 = a5;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "setDismissalOperation:", 2);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PlayerViewControllerKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(v6);
  objc_msgSend(v10, "setAvPlayerViewController:", v9);

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "vui_setObjectIfNotNil:forKey:", v9, VUIPlaybackManagerNotificationKeyPlayerViewController);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  v12 = objc_loadWeakRetained(v6);
  objc_msgSend(v12, "_pushMoreInfoControllerIfNeeded");

  return CFSTR("Showing multiview playback in PIP");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_14_875()
{
  return CFSTR("Showing video full screen");
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_15_877(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  __CFString *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v6 = (id *)(a1 + 40);
  v7 = a4;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "extrasAVPlayerViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11 = sLogObject_5;
  v12 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (v10 == v7)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Stopping extras content playback because AVPlayerViewController was dismissed", buf, 2u);
    }
    objc_msgSend(v8, "currentState");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v14 = objc_loadWeakRetained(v6);
    objc_msgSend(v14, "extrasPlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stop");

  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Stopping main content playback because AVPlayerViewController was dismissed", buf, 2u);
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_878;
    v17[3] = &unk_1E9F98E68;
    v18 = *(id *)(a1 + 32);
    objc_msgSend(v8, "executeBlockAfterCurrentStateTransition:", v17);

    v13 = CFSTR("Not showing anything");
    v14 = v18;
  }

  return v13;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_878(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_879()
{
  return CFSTR("Not showing anything");
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_881(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;

  v6 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("CompletionKey"));
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
  {
    __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_881_cold_1();
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v7)
LABEL_3:
    v7[2](v7, 0);
LABEL_4:
  objc_msgSend(v6, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_883(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id WeakRetained;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  int v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  uint8_t buf[16];
  _QWORD v77[4];
  id v78;
  id v79;
  _QWORD aBlock[4];
  void (**v81)(_QWORD, _QWORD);

  v9 = a2;
  v75 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "objectForKey:", CFSTR("CompletionKey"));
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentState");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  +[VUIApplicationRouter currentNavigationController](VUIApplicationRouter, "currentNavigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentedViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(v14, "topViewController");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "topViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dismissViewControllerAnimated:completion:", 0, 0);

    objc_msgSend(v14, "topViewController");
    v21 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v21;
  }
  v74 = v10;
  if (v19)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "playbackContainerViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 == v23)
    {
      objc_msgSend(v14, "topViewController");
      v24 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v24;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  else if (v19)
  {
    goto LABEL_15;
  }
  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appWindow");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "rootViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentedViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v27, "dismissViewControllerAnimated:completion:", 1, 0);

LABEL_15:
  v28 = (id *)(a1 + 32);
  v29 = objc_loadWeakRetained(v28);
  objc_msgSend(v29, "setPresentingViewController:", v19);

  LODWORD(v29) = +[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled");
  v30 = objc_loadWeakRetained(v28);
  v31 = v30;
  if ((_DWORD)v29)
    v32 = 2;
  else
    v32 = 0;
  objc_msgSend(v30, "setDismissalOperation:", v32);

  if (!v19
    || (v33 = objc_loadWeakRetained(v28),
        objc_msgSend(v33, "avPlayerViewController"),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v34,
        v33,
        !v34))
  {
    v37 = (void *)sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
    {
      __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_883_cold_1(v19 == 0, v37);
      if (!v12)
        goto LABEL_25;
    }
    else if (!v12)
    {
LABEL_25:
      v38 = v75;
      goto LABEL_42;
    }
    v12[2](v12, 0);
    goto LABEL_25;
  }
  objc_msgSend(v9, "currentState");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("Showing main video picture in picture"));

  if (v36)
  {

    v13 = CFSTR("Showing video full screen");
  }
  else
  {
    objc_msgSend(v9, "currentState");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("Showing multiview playback in PIP"));

    if (v40)
      v13 = CFSTR("Showing multiview playback");
    else
      v13 = CFSTR("Showing multiview playback fullscreen");
  }
  v41 = objc_loadWeakRetained(v28);
  objc_msgSend(v41, "avPlayerViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "presentingViewController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_885;
    aBlock[3] = &unk_1E9F98E68;
    v81 = v12;
    v73 = _Block_copy(aBlock);
    v45 = objc_loadWeakRetained(v28);
    if ((objc_msgSend(v45, "_isNewPostPlayEnabled") & 1) != 0)
    {
      v46 = objc_loadWeakRetained(v28);
      objc_msgSend(v46, "moreInfoCanonicalViewController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v47)
      {
        objc_msgSend(v9, "currentState");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("Showing multiview playback in PIP"));

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "presentedViewController");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v49;
          v51 = objc_loadWeakRetained(v28);
          objc_msgSend(v51, "playbackContainerViewController");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = v71;
          if (v50 == v52)
          {
            v72 = objc_loadWeakRetained(v28);
            objc_msgSend(v72, "playbackContainerViewController");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_loadWeakRetained(v28);
            objc_msgSend(v68, "avPlayerViewController");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = v73;
            objc_msgSend(v67, "presentPlayerViewController:animated:completion:", v69, 1, v73);

            goto LABEL_47;
          }
        }
        v53 = objc_loadWeakRetained(v28);
        v54 = v53;
        if (v49)
        {
          v55 = v53;
          objc_msgSend(v55, "avPlayerViewController");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "_multiviewInfoForPlayerViewController:", v56);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v72, "setContext:", 1);
          v70 = objc_loadWeakRetained(v28);
          objc_msgSend(v70, "playbackContainerViewController");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_loadWeakRetained(v28);
          objc_msgSend(v58, "multiPlayerViewController");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "embedMultiPlayerViewController:", v59);

          v60 = objc_loadWeakRetained(v28);
          objc_msgSend(v60, "playbackContainerViewController");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v73;
          objc_msgSend(v19, "presentViewController:animated:completion:", v61, 1, v73);

LABEL_47:
          goto LABEL_41;
        }
        objc_msgSend(v53, "playbackContainerViewController");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_886;
        v77[3] = &unk_1E9F9A060;
        objc_copyWeak(&v79, v28);
        v62 = v73;
        v78 = v73;
        objc_msgSend(v19, "presentViewController:animated:completion:", v66, 0, v77);

        objc_destroyWeak(&v79);
LABEL_41:
        v10 = v74;
        v38 = v75;

        goto LABEL_42;
      }
    }
    else
    {

    }
    v63 = objc_loadWeakRetained(v28);
    objc_msgSend(v63, "avPlayerViewController");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v73;
    objc_msgSend(v19, "presentViewController:animated:completion:", v64, 1, v73);

    goto LABEL_41;
  }
  v44 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v44, OS_LOG_TYPE_DEFAULT, "Not presenting AVPlayerViewController since it is already being presented", buf, 2u);
  }
  v10 = v74;
  v38 = v75;
LABEL_42:

  return v13;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_885(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_886(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "avPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentPlayerViewController:animated:completion:", v5, 1, *(_QWORD *)(a1 + 32));

}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_887(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void (**v8)(_QWORD, _QWORD);
  __CFString *v9;
  id *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint8_t v28[8];
  _QWORD aBlock[4];
  void (**v30)(_QWORD, _QWORD);

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("CompletionKey"));
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentState");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v10);
  objc_msgSend(WeakRetained, "extrasContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extrasRootViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained(v10);
  objc_msgSend(v14, "setPresentingViewController:", v13);

  v15 = objc_loadWeakRetained(v10);
  objc_msgSend(v15, "setDismissalOperation:", 0);

  if (!v13
    || (v16 = objc_loadWeakRetained(v10),
        objc_msgSend(v16, "avPlayerViewController"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    v22 = (void *)sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
    {
      __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_887_cold_1(v13 == 0, v22);
      if (!v8)
        goto LABEL_11;
    }
    else if (!v8)
    {
      goto LABEL_11;
    }
    v8[2](v8, 0);
    goto LABEL_11;
  }

  v18 = objc_loadWeakRetained(v10);
  objc_msgSend(v18, "avPlayerViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentingViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "Not presenting AVPlayerViewController since it is already being presented", v28, 2u);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_888;
    aBlock[3] = &unk_1E9F98E68;
    v30 = v8;
    v23 = _Block_copy(aBlock);
    v24 = objc_loadWeakRetained(v10);
    objc_msgSend(v24, "avPlayerViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentViewController:animated:completion:", v25, 1, v23);

  }
  v9 = CFSTR("Showing video full screen");
LABEL_11:
  v26 = objc_loadWeakRetained(v10);
  objc_msgSend(v26, "_resetAutoPlayBingeWatchingQualifications");

  return v9;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_888(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_889(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void (**v8)(_QWORD, _QWORD);
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  id WeakRetained;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint8_t v29[8];
  _QWORD aBlock[4];
  void (**v31)(_QWORD, _QWORD);

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("CompletionKey"));
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentState");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v14);
  objc_msgSend(WeakRetained, "setPresentingViewController:", v13);

  v16 = objc_loadWeakRetained(v14);
  objc_msgSend(v16, "setDismissalOperation:", 0);

  if (!v13
    || (v17 = objc_loadWeakRetained(v14),
        objc_msgSend(v17, "avPlayerViewController"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        v17,
        !v18))
  {
    v23 = (void *)sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_ERROR))
    {
      __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_887_cold_1(v13 == 0, v23);
      if (!v8)
        goto LABEL_11;
    }
    else if (!v8)
    {
      goto LABEL_11;
    }
    v8[2](v8, 0);
    goto LABEL_11;
  }

  v19 = objc_loadWeakRetained(v14);
  objc_msgSend(v19, "avPlayerViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "presentingViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1D96EE000, v22, OS_LOG_TYPE_DEFAULT, "Not presenting AVPlayerViewController since it is already being presented", v29, 2u);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_890;
    aBlock[3] = &unk_1E9F98E68;
    v31 = v8;
    v24 = _Block_copy(aBlock);
    v25 = objc_loadWeakRetained(v14);
    objc_msgSend(v25, "avPlayerViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentViewController:animated:completion:", v26, 1, v24);

  }
  v9 = CFSTR("Showing extras video full screen outside extras content");
LABEL_11:
  v27 = objc_loadWeakRetained(v14);
  objc_msgSend(v27, "_resetAutoPlayBingeWatchingQualifications");

  return v9;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_890(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_891(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  char v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  id *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[16];

  v7 = a2;
  v8 = a5;
  objc_msgSend(v7, "currentState");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("IsRestoringUserInterfaceDueToAirPlayStart"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "BOOLValue");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "activePlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "externalPlaybackType");

  v15 = sLogObject_5;
  v16 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (v14 != 1 || (v11 & 1) != 0)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Stopping playback because picture in picture is ending without going back to fullscreen playback", buf, 2u);
    }
    v18 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v18, "stateMachine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_893;
    v21[3] = &unk_1E9F98E68;
    v17 = &v22;
    v22 = *(id *)(a1 + 32);
    objc_msgSend(v19, "executeBlockAfterCurrentStateTransition:", v21);

    v9 = CFSTR("Not showing anything");
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "AirPlay was started while in PIP mode.  Restoring full screen user interface by manually posting PIP events", buf, 2u);
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_892;
    v23[3] = &unk_1E9F98DF0;
    v17 = &v24;
    v24 = v7;
    objc_msgSend(v24, "executeBlockAfterCurrentStateTransition:", v23);
  }

  return v9;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_892(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v13 = CFSTR("IsRestoringUserInterfaceDueToAirPlayStart");
  v3 = MEMORY[0x1E0C9AAB0];
  v14[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Restore user interface for picture in picture stop"), 0, v4);

  v5 = *(void **)(a1 + 32);
  v11 = CFSTR("IsRestoringUserInterfaceDueToAirPlayStart");
  v12 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Will stop picture in picture"), 0, v6);

  v7 = *(void **)(a1 + 32);
  v9 = CFSTR("IsRestoringUserInterfaceDueToAirPlayStart");
  v10 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Did stop picture in picture"), 0, v8);

}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_893(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_894(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  char v9;
  id *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  uint8_t buf[16];

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("IsRestoringUserInterfaceDueToAirPlayStart"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activePlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "externalPlaybackType");

  v14 = sLogObject_5;
  v15 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (v13 != 1 || (v9 & 1) != 0)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Stopping playback because picture in picture is ending without going back to fullscreen playback", buf, 2u);
    }
    v17 = objc_loadWeakRetained(v10);
    objc_msgSend(v17, "extrasPlayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stop");

    v16 = objc_loadWeakRetained(v10);
    objc_msgSend(v16, "setExtrasAVPlayerViewController:", 0);
  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "AirPlay was started while in PIP mode.  Restoring full screen user interface by manually posting PIP events", buf, 2u);
    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_895;
    v21[3] = &unk_1E9F98DF0;
    v22 = v7;
    objc_msgSend(v22, "executeBlockAfterCurrentStateTransition:", v21);
    v16 = v22;
  }

  objc_msgSend(v7, "currentState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_895(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v13 = CFSTR("IsRestoringUserInterfaceDueToAirPlayStart");
  v3 = MEMORY[0x1E0C9AAB0];
  v14[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Restore user interface for picture in picture stop"), 0, v4);

  v5 = *(void **)(a1 + 32);
  v11 = CFSTR("IsRestoringUserInterfaceDueToAirPlayStart");
  v12 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Will stop picture in picture"), 0, v6);

  v7 = *(void **)(a1 + 32);
  v9 = CFSTR("IsRestoringUserInterfaceDueToAirPlayStart");
  v10 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Did stop picture in picture"), 0, v8);

}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_896(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t v33[16];

  objc_msgSend(a2, "currentState");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Finished restoring to full screen from picture in picture, updating extras", v33, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "avPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  v12 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v12, "extrasContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "shouldExtrasBeVisibleForSize:", v9, v11))
  {
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "groupActivitiesManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isSessionActive") ^ 1;

  }
  else
  {
    v16 = 0;
  }

  v17 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v17, "_setExtrasButtonVisible:", v16);

  v18 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v18, "featureMonitor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "featuresForType:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (objc_msgSend(v21, "isActive"))
    {
      v22 = objc_loadWeakRetained((id *)(a1 + 40));
      v23 = objc_msgSend(v22, "configuredPostPlay");

      if (v23)
      {
        v24 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v24, "postPlayView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {

        }
        else
        {
          v26 = objc_loadWeakRetained((id *)(a1 + 40));
          v27 = objc_msgSend(v26, "_isNewPostPlayEnabled");

          if (!v27)
            goto LABEL_15;
        }
        v28 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v28, "avPlayerViewController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "view");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

          v3 = CFSTR("Showing video full screen with post play content on screen");
        }

      }
    }
  }
LABEL_15:
  v31 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v31, "_removeMoreInfoViewControllerIfNeeded");

  return v3;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_897(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  __CFString *v10;
  id WeakRetained;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a2, "currentState");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "activePlayer");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v9)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DB1F60]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
    {
      v15 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v15, "stateMachine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_898;
      v18[3] = &unk_1E9F98E68;
      v19 = *(id *)(a1 + 32);
      objc_msgSend(v16, "executeBlockAfterCurrentStateTransition:", v18);

      v10 = CFSTR("Not showing anything");
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  return v10;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_898(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_899(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0DB1F60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentState");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "loading");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v8 == (void *)v10)
  {

LABEL_5:
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_900;
    v14[3] = &unk_1E9F98E68;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v7, "executeBlockAfterCurrentStateTransition:", v14);

    v9 = CFSTR("Showing video full screen");
    goto LABEL_6;
  }
  v11 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v12)
    goto LABEL_5;
LABEL_6:

  return v9;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_900(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_901(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a2;
  objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0DB1F60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_903;
    v11[3] = &unk_1E9F98DF0;
    v12 = v6;
    objc_msgSend(v12, "executeBlockAfterCurrentStateTransition:", v11);

  }
  return v8;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_903(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Post play hide playback"));
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_904(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id *v20;
  id WeakRetained;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  __CFString *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  char v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v47;
  int v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  uint8_t buf[16];

  v8 = a2;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0DB1F60]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentState");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v13)
  {
    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 != v14)
    {

      goto LABEL_25;
    }
    v20 = (id *)(a1 + 64);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "mainPlayer");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v22 != v9)
      goto LABEL_25;
    v23 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v23, "featureMonitor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "featuresForType:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (id *)(a1 + 64);
    v27 = objc_loadWeakRetained((id *)(a1 + 64));
    if (objc_msgSend(v27, "configuredPostPlay") && v52 && objc_msgSend(v52, "isActive"))
    {
      objc_msgSend(v8, "currentState");
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v20 = (id *)(a1 + 64);
      if (v28 == CFSTR("Showing video full screen with post play content on screen"))
        goto LABEL_20;
      v29 = objc_loadWeakRetained(v26);
      objc_msgSend(v29, "postPlayView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {

      }
      else
      {
        v47 = objc_loadWeakRetained(v26);
        v48 = objc_msgSend(v47, "_isNewPostPlayEnabled");

        if (!v48)
        {
LABEL_20:
          v36 = objc_loadWeakRetained(v20);
          objc_msgSend(v36, "mainPlayer");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "currentMediaItem");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "_showShareMediaMenuForMediaItem:", v38);

          v39 = objc_loadWeakRetained(v20);
          if (objc_msgSend(v39, "_shouldShowPerformanceDebugger"))
          {
            v40 = objc_loadWeakRetained(v20);
            v41 = objc_msgSend(v40, "hasPerformanceDebuggerAppeared");

            if ((v41 & 1) != 0)
            {
LABEL_24:

              goto LABEL_25;
            }
            v51 = objc_loadWeakRetained(v20);
            objc_msgSend(v51, "mainPlayer");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "currentMediaItem");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v44 = objc_loadWeakRetained(v20);
            objc_msgSend(v44, "_setupPerformanceDebugger:", v39);

            v45 = objc_loadWeakRetained(v20);
            objc_msgSend(v45, "setHasPerformanceDebuggerAppeared:", 1);

          }
          goto LABEL_24;
        }
      }
      v49 = objc_loadWeakRetained(v20);
      objc_msgSend(v49, "avPlayerViewController");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        v12 = CFSTR("Showing video full screen with post play content on screen");
      }
    }

    goto LABEL_20;
  }
  v15 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v15, "mainPlayer");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v9)
  {
    if (!v10
      || (objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DB1F50]),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = (void *)*MEMORY[0x1E0DB1E00],
          v31,
          v31 != v32))
    {
      v33 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v33, OS_LOG_TYPE_DEFAULT, "Will dismiss AVPlayerViewController controller since playback has stopped", buf, 2u);
      }
      v34 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v34, "stateMachine");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_905;
      v53[3] = &unk_1E9F98E68;
      v54 = *(id *)(a1 + 32);
      objc_msgSend(v35, "executeBlockAfterCurrentStateTransition:", v53);

      v12 = CFSTR("Not showing anything");
    }
  }
  else
  {
    v17 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v17, "extrasPlayer");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18 == v9)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v19 = objc_claimAutoreleasedReturnValue();

      v12 = (__CFString *)v19;
    }
  }
LABEL_25:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  return v12;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_905(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_906(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentState");
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_908(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  id v15;
  void *v16;
  void *v17;
  __CFString *v18;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v13);
  objc_msgSend(WeakRetained, "activePlayer");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v11)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0DB1F60]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 == v17)
    {
      v20 = objc_loadWeakRetained(v13);
      objc_msgSend(v20, "mainAVPlayerViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAvPlayerViewController:", v21);

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_909;
      v22[3] = &unk_1E9F99C98;
      objc_copyWeak(&v23, v13);
      objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v22);
      objc_destroyWeak(&v23);

      v18 = CFSTR("Showing Extras content");
      goto LABEL_5;
    }

  }
  objc_msgSend(v9, "currentState");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v18;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_909(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "backgroundAudioPlayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "play");

}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_910(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentState");
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_912(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentState");
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_914(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v8 = a2;
  v9 = a5;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "activePlayer");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v10)
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DB1F60]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
    {
      v15 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v15, "stateMachine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_915;
      v19[3] = &unk_1E9F98E68;
      v20 = *(id *)(a1 + 32);
      objc_msgSend(v16, "executeBlockAfterCurrentStateTransition:", v19);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  objc_msgSend(v8, "currentState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_915(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_916(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id *v25;
  id WeakRetained;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;

  v8 = a2;
  v9 = a4;
  objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0DB1F60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "applicationState");

    if (v14 != 2)
    {
      v25 = (id *)(a1 + 32);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_multiviewInfoForPlayer:", v11);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "playerViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = objc_loadWeakRetained(v25);
        objc_msgSend(v28, "multiPlayerViewController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "playerViewController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "removePlayerViewController:animated:completion:", v30, 1, 0);

      }
      objc_msgSend(v18, "player");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "invalidate");

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "player");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v18, "player");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKey:", v34, VUIPlaybackManagerNotificationKeyPlayer[0]);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v32, "copy");
      objc_msgSend(v35, "postNotificationName:object:userInfo:", CFSTR("VUIMultiviewPlayerDidStopNotification"), 0, v36);

      v37 = objc_loadWeakRetained(v25);
      objc_msgSend(v37, "multiviewPlaybackInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "removeObject:", v18);

      v39 = objc_loadWeakRetained(v25);
      objc_msgSend(v39, "_updateMultiviewReportingMetrics");

      goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v15)
  {
    v19 = (id *)(a1 + 32);
    v20 = objc_loadWeakRetained(v19);
    objc_msgSend(v20, "_updateMultiviewReportingMetrics");

    v21 = objc_loadWeakRetained(v19);
    objc_msgSend(v21, "mainPlayer");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v22 == v11)
    {
      v18 = objc_loadWeakRetained(v19);
      objc_msgSend(v18, "mainPlayer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "currentMediaItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_showShareMediaMenuForMediaItem:", v24);

LABEL_15:
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DB1958], "paused");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v16)
    {
      v17 = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v17, "_multiviewInfoForPlayer:", v11);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "pausedDueToInterruption"))
      {
        objc_msgSend(v11, "play");
        objc_msgSend(v18, "setPausedDueToInterruption:", 0);
      }
      goto LABEL_15;
    }
  }
  objc_msgSend(v8, "currentState");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_917(uint64_t a1, void *a2)
{
  __CFString *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];

  objc_msgSend(a2, "currentState");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "avPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v11, "extrasContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v12, "shouldExtrasBeVisibleForSize:", v8, v10);

  if ((_DWORD)v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v3 = CFSTR("Showing Extras content");
  }
  else
  {
    v13 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Not showing Extras because they cannot be displayed for the current view size", v15, 2u);
    }
  }
  return v3;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_918(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_919;
  v22 = &unk_1E9F9B6C0;
  v16 = v12;
  v23 = v16;
  objc_copyWeak(&v24, v13);
  objc_msgSend(v15, "executeBlockAfterCurrentStateTransition:", &v19);

  objc_msgSend(v9, "currentState", v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v24);

  return v17;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_919(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("MenuItemElementKey"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("MenuItemIndexKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "extrasContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedMainMenuIndex");

  if (v3 != v7)
  {
    v8 = objc_loadWeakRetained(v4);
    objc_msgSend(v8, "extrasContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClearsStackOnNextPush");

    v10 = objc_loadWeakRetained(v4);
    objc_msgSend(v10, "extrasContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelectedMainMenuIndex:", v3);

    objc_msgSend(v12, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 0, 0, 0);
  }

}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_920(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  id WeakRetained;
  void *v13;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("ExtrasShouldBeVisibleKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if ((_DWORD)v9)
      v11 = CFSTR("YES");
    v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Extras should be visible?  %@", (uint8_t *)&v15, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setExtrasButtonVisible:", v9);

  objc_msgSend(v7, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_921(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  int v9;
  __CFString *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  int v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("ExtrasShouldBeVisibleKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v7, "currentState");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v11 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("NO");
    if (v9)
      v12 = CFSTR("YES");
    v25 = 138412290;
    v26 = v12;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Extras should be visible?  %@", (uint8_t *)&v25, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "applicationState");

  if (v14 == 2)
  {
    v15 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring Extras visibility update since app is backgrounded.", (uint8_t *)&v25, 2u);
    }
  }
  else if (v9)
  {
    v16 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained(v16);
    objc_msgSend(WeakRetained, "backgroundAudioPlayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "state");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "paused");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 == v20)
    {
      v21 = objc_loadWeakRetained(v16);
      objc_msgSend(v21, "backgroundAudioPlayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "play");

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v23 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v23, "_setExtrasButtonVisible:", 0);

    v10 = CFSTR("Showing video full screen");
  }
  return v10;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_922(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  int v9;
  __CFString *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("ExtrasShouldBeVisibleKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v7, "currentState");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("NO");
    if (v9)
      v12 = CFSTR("YES");
    v18 = 138412290;
    v19 = v12;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Extras should be visible?  %@", (uint8_t *)&v18, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "applicationState");

  if (v14 == 2)
  {
    v15 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring Extras visibility update since app is backgrounded.", (uint8_t *)&v18, 2u);
    }
  }
  else if ((v9 & 1) == 0)
  {
    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    {

      v10 = CFSTR("Showing extras video picture in picture outside extras content");
    }
    else
    {
      objc_msgSend(v7, "currentState");
      v16 = objc_claimAutoreleasedReturnValue();

      v10 = (__CFString *)v16;
    }
  }

  return v10;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_923(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_924;
  v17[3] = &unk_1E9F99C98;
  objc_copyWeak(&v18, (id *)(a1 + 32));
  objc_msgSend(v14, "executeBlockAfterCurrentStateTransition:", v17);

  objc_msgSend(v9, "currentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v18);

  return v15;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_924(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExtrasControlItem:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_mainPlayerViewControllerSetupControlItems");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setExtrasContext:", 0);

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_925(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  void *v15;
  _QWORD v17[4];
  id v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v13 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateMachine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_926;
  v17[3] = &unk_1E9F99C98;
  objc_copyWeak(&v18, v13);
  objc_msgSend(v15, "executeBlockAfterCurrentStateTransition:", v17);

  objc_destroyWeak(&v18);
  return CFSTR("Showing video full screen");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_926(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExtrasControlItem:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_mainPlayerViewControllerSetupControlItems");

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setExtrasContext:", 0);

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_927(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return CFSTR("Showing video full screen");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_928(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "extrasPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setExtrasPlayer:", 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "setExtrasAVPlayerViewController:", 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return CFSTR("Showing video full screen");
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_929(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id *v16;
  id WeakRetained;
  void *v18;
  VUIPlayer *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  VUIPlayer *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v44;
  __CFString *v45;
  void *v46;
  _QWORD v47[4];
  id v48;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKey:", CFSTR("IsBackgroundPlaybackKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v12, "objectForKey:", CFSTR("PlaylistKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentState");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v18 = WeakRetained;
  if ((_DWORD)a4)
  {
    objc_msgSend(WeakRetained, "backgroundAudioPlayer");
    v19 = (VUIPlayer *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v19 = -[VUIPlayer initWithName:]([VUIPlayer alloc], "initWithName:", CFSTR("Background audio player"));
      -[TVPPlayer setReportingValueWithString:forKey:](v19, "setReportingValueWithString:forKey:", CFSTR("background"), CFSTR("initiator"));
      v20 = objc_loadWeakRetained(v16);
      objc_msgSend(v20, "setBackgroundAudioPlayer:", v19);

    }
    v21 = objc_loadWeakRetained(v16);
    objc_msgSend(v21, "mainPlayer");
    v22 = objc_claimAutoreleasedReturnValue();
    -[TVPPlayer setAllowsCellularUsage:](v19, "setAllowsCellularUsage:", objc_msgSend((id)v22, "allowsCellularUsage"));

    objc_msgSend(v14, "setRepeatMode:", 1);
    -[TVPPlayer playlist](v19, "playlist");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = objc_msgSend(v14, "isEqualToPlaylist:", v23);

    if ((v22 & 1) == 0)
      -[TVPPlayer setPlaylist:](v19, "setPlaylist:", v14);
    -[TVPPlayer play](v19, "play");

  }
  else
  {
    v45 = v15;
    objc_msgSend(WeakRetained, "activePlayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stop");

    v25 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v25, "backgroundAudioPlayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stop");

    v27 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v27, "extrasPlayer");
    v28 = (VUIPlayer *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      v28 = -[VUIPlayer initWithName:]([VUIPlayer alloc], "initWithName:", CFSTR("Extras player"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      -[TVPPlayer setErrorBehavior:](v28, "setErrorBehavior:", 2);
      -[TVPPlayer setReportingValueWithString:forKey:](v28, "setReportingValueWithString:forKey:", CFSTR("fullscreen"), CFSTR("initiator"));
      v29 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v29, "setExtrasPlayer:", v28);

    }
    v30 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v30, "mainPlayer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer setAllowsCellularUsage:](v28, "setAllowsCellularUsage:", objc_msgSend(v31, "allowsCellularUsage"));

    v46 = v14;
    -[TVPPlayer setPlaylist:](v28, "setPlaylist:", v14);
    objc_msgSend(v12, "objectForKey:", CFSTR("PresentingViewControllerKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v34 = v32;
    }
    else
    {
      v35 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v35, "extrasContext");
      v44 = v12;
      v36 = a1;
      v37 = v11;
      v38 = v10;
      v39 = v9;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "extrasRootViewController");
      v34 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v39;
      v10 = v38;
      v11 = v37;
      a1 = v36;
      v12 = v44;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v41 = objc_loadWeakRetained(v16);
    objc_msgSend(v41, "stateMachine");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_934;
    v47[3] = &unk_1E9F99C98;
    objc_copyWeak(&v48, v16);
    objc_msgSend(v42, "executeBlockAfterCurrentStateTransition:", v47);

    objc_destroyWeak(&v48);
    v15 = CFSTR("Waiting for Extras AVPlayerViewController presentation to complete");
    v14 = v46;
  }

  return v15;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_934(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "extrasPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEndEventWithName:", *MEMORY[0x1E0DB1F28]);

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "extrasPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActivePlayer:", v7);

  v9 = objc_loadWeakRetained(v1);
  objc_msgSend(v9, "extrasPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "play");

}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_935(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;
  void *v15;
  id *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[16];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKey:", CFSTR("IsBackgroundPlaybackKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v9, "currentState");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((a4 & 1) == 0)
  {
    v42 = v11;
    objc_msgSend(v12, "objectForKey:", CFSTR("PlaylistKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = a1;
    v16 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "extrasPlayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "playlist");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentMediaItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "currentMediaItem");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained(v16);
    objc_msgSend(v20, "extrasPlayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "playlist");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v15, "isEqualToPlaylist:", v22);

    if (!v23)
      goto LABEL_9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    v24 = v43;
    objc_msgSend(v44, "clipTimeRange");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "clipTimeRange");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v24) = objc_msgSend(v25, "isEqual:", v26);
    if (!(_DWORD)v24)
    {
LABEL_9:
      v40 = v10;
      v30 = objc_loadWeakRetained(v16);
      objc_msgSend(v30, "backgroundAudioPlayer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stop");

      v32 = objc_loadWeakRetained(v16);
      objc_msgSend(v32, "extrasPlayer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "stop");
      objc_msgSend(v28, "setPlaylist:", v15);
      objc_msgSend(v12, "objectForKey:", CFSTR("PresentingViewControllerKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        v29 = v33;
      }
      else
      {
        v35 = objc_loadWeakRetained(v16);
        objc_msgSend(v35, "extrasContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "extrasRootViewController");
        v29 = (id)objc_claimAutoreleasedReturnValue();

      }
      (*(void (**)(void))(*(_QWORD *)(v41 + 32) + 16))();
      v37 = objc_loadWeakRetained(v16);
      objc_msgSend(v37, "stateMachine");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_937;
      v45[3] = &unk_1E9F99C98;
      objc_copyWeak(&v46, v16);
      objc_msgSend(v38, "executeBlockAfterCurrentStateTransition:", v45);

      objc_destroyWeak(&v46);
      v14 = CFSTR("Waiting for Extras AVPlayerViewController presentation to complete");
      v10 = v40;
    }
    else
    {
LABEL_6:
      v27 = sLogObject_5;
      if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v27, OS_LOG_TYPE_DEFAULT, "Content is already being played in PIP.  Calling stopPictureInPicture to restore to fullscreen", buf, 2u);
      }
      v28 = objc_loadWeakRetained(v16);
      objc_msgSend(v28, "extrasAVPlayerViewController");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stopPictureInPicture");
    }

    v11 = v42;
  }

  return v14;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_937(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "extrasPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEndEventWithName:", *MEMORY[0x1E0DB1F28]);

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "extrasPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActivePlayer:", v7);

  v9 = objc_loadWeakRetained(v1);
  objc_msgSend(v9, "extrasPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "play");

}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_938(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id *v12;
  id WeakRetained;
  id v14;
  void *v15;
  uint8_t v17[16];

  v8 = a2;
  v9 = a4;
  v10 = a5;
  v11 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Error occurred while view controller is being presented.  Will present error dialog when presentation completes", v17, 2u);
  }
  v12 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v12);
  objc_msgSend(WeakRetained, "setSavedErrorContext:", v9);

  v14 = objc_loadWeakRetained(v12);
  objc_msgSend(v14, "setSavedErrorUserInfo:", v10);

  objc_msgSend(v8, "currentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_939(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  __CFString *v15;
  void *v16;
  int v17;
  id WeakRetained;
  void *v19;
  id *v20;
  id v21;
  id v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  __CFString *v31;
  __CFString *v32;
  id v33;
  void *v34;
  id v35;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  __CFString *v41;
  id v42;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0DB1F80]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v9, "currentState");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Showing video full screen with post play content on screen"));

  if (v17)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "featureMonitor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeFeaturesMatching:", &unk_1EA0BB898);

    v15 = CFSTR("Showing video full screen");
  }
  v20 = (id *)(a1 + 40);
  v21 = objc_loadWeakRetained(v20);
  objc_msgSend(v21, "activePlayer");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22 == v11)
    v23 = v14;
  else
    v23 = 0;

  if (v23 == 1)
  {
    v37 = v11;
    v38 = v10;
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0DB1E40]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_loadWeakRetained(v20);
    objc_msgSend(v25, "activePlayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "currentMediaItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1EF0], *MEMORY[0x1E0DB1F38]);

    objc_msgSend(v9, "currentState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("Showing main video picture in picture"));
    v31 = CFSTR("Showing error message on playback UI");
    if (v30)
      v31 = CFSTR("Showing error message without playback UI");
    v32 = v31;

    v33 = objc_loadWeakRetained(v20);
    objc_msgSend(v33, "stateMachine");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_942;
    v39[3] = &unk_1E9F9C058;
    v35 = v24;
    v40 = v35;
    objc_copyWeak(&v42, v20);
    v15 = v32;
    v41 = v15;
    objc_msgSend(v34, "executeBlockAfterCurrentStateTransition:", v39);

    objc_destroyWeak(&v42);
    v11 = v37;
    v10 = v38;
  }

  return v15;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_942(uint64_t a1)
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void (**v27)(void *, void *, void *);
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id WeakRetained;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id *v57;
  void *v58;
  void *v59;
  void *v60;
  id *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  char v68;
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
  uint64_t v86;
  id *from;
  void *v88;
  _QWORD aBlock[4];
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  _QWORD v96[4];
  id v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;
  _QWORD v102[4];
  id v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[4];
  id v109;
  _QWORD v110[4];
  id v111;
  _QWORD v112[4];
  id v113;
  id v114[2];

  v2 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:", CFSTR("OK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = MEMORY[0x1E0C809B0];
  v112[1] = 3221225472;
  v112[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_943;
  v112[3] = &unk_1E9F9D8F8;
  v113 = *(id *)(a1 + 32);
  from = (id *)(a1 + 48);
  objc_copyWeak(v114, (id *)(a1 + 48));
  objc_msgSend(v2, "actionWithTitle:style:handler:", v4, 0, v112);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v6, "isEqualToString:", CFSTR("TVPlaybackErrorDomain"));

  v86 = a1;
  if (!(_DWORD)v2)
  {
    v21 = 0;
    v22 = 0;
    v20 = 0;
    v88 = 0;
    v8 = 0;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CB2D50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CB2D80]);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "code") != 825)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "code") == 824)
    {
      v28 = MGGetBoolAnswer();
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKey:", CFSTR("TVPlaybackCellularPlaybackProhibitedErrorReasonKey"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "integerValue");

      if (v31 == 1)
      {
        WeakRetained = objc_loadWeakRetained(from);
        objc_msgSend(WeakRetained, "activePlayer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "currentMediaItem");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = objc_msgSend(v35, "isEqualToString:", *MEMORY[0x1E0DB1DD8]);
        if (v28)
        {
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringForKey:", CFSTR("CANT_PLAYBACK_OVER_WLAN_ERROR_TITLE"));
          v38 = objc_claimAutoreleasedReturnValue();

          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          if ((v36 & 1) != 0)
          {
LABEL_13:
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "localizedStringForKey:", CFSTR("CONNECT_TO_WLAN_TO_PLAYBACK_ERROR_MESSAGE_EPISODE"));
LABEL_44:
            v88 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
            v21 = 0;
            v22 = 0;
            v20 = 0;
            v8 = (void *)v38;
            goto LABEL_5;
          }
LABEL_47:
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringForKey:", CFSTR("CONNECT_TO_WLAN_TO_PLAYBACK_ERROR_MESSAGE_MOVIE"));
          goto LABEL_44;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("CANT_PLAYBACK_OVER_CELLULAR_NETWORK_ERROR_TITLE"), 0, CFSTR("VideosUIEmbedded"));
        v38 = objc_claimAutoreleasedReturnValue();

        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        if ((v36 & 1) != 0)
          goto LABEL_43;
        goto LABEL_48;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_TITLE"), 0, CFSTR("VideosUIEmbedded"));
      v63 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
      if (v28)
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_MESSAGE_WLAN"), 0, CFSTR("VideosUIEmbedded"));
      }
      else
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("ASK_TO_ENABLE_CELLULAR_DATA_TO_STREAM_MESSAGE_WIFI"), 0, CFSTR("VideosUIEmbedded"));
      }
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      v70 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("ENABLE_CELLULAR_DATA_TO_STREAM_BUTTON_TITLE"), 0, CFSTR("VideosUIEmbedded"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = (void *)v63;
      v106[0] = MEMORY[0x1E0C809B0];
      v106[1] = 3221225472;
      v106[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_982;
      v106[3] = &unk_1E9F9A7A8;
      v52 = &v107;
      objc_copyWeak(&v107, from);
      objc_msgSend(v70, "actionWithTitle:style:handler:", v72, 0, v106);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("USE_CELLULAR_DATA_TO_STREAM_ONCE_BUTTON_TITLE"), 0, CFSTR("VideosUIEmbedded"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v104[0] = MEMORY[0x1E0C809B0];
      v104[1] = 3221225472;
      v104[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_985;
      v104[3] = &unk_1E9F9A7A8;
      v57 = &v105;
      objc_copyWeak(&v105, from);
      objc_msgSend(v74, "actionWithTitle:style:handler:", v76, 0, v104);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "vui_videosUIBundle");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("DONT_ENABLE_CELLULAR_DATA_TO_STREAM_BUTTON_TITLE"), 0, CFSTR("VideosUIEmbedded"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v102[0] = MEMORY[0x1E0C809B0];
      v102[1] = 3221225472;
      v102[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_988;
      v102[3] = &unk_1E9F9A7A8;
      objc_copyWeak(&v103, from);
      objc_msgSend(v77, "actionWithTitle:style:handler:", v79, 0, v102);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v73;
      v61 = &v103;
LABEL_32:
      objc_destroyWeak(v61);
      objc_destroyWeak(v57);
      objc_destroyWeak(v52);
      v5 = v22;
      v8 = v84;
      goto LABEL_5;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "code") == 827)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedStringForKey:", CFSTR("AIRPLAY_CANNOT_STREAM_THIS_VIDEO_FORMAT_TO_DEVICE_MESSAGE"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 32), "code") == 826)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:", CFSTR("DIGITAL_ADAPTER_COMPATIBILITY_WARNING_TITLE"));
        v47 = objc_claimAutoreleasedReturnValue();

        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "localizedStringForKey:", CFSTR("DIGITAL_ADAPTER_COMPATIBILITY_WARNING_BODY"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = (void *)MEMORY[0x1E0DC3448];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringForKey:", CFSTR("DIGITAL_ADAPTER_COMPATIBILITY_WARNING_ACTION_DOWNLOAD"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)v47;
        v100[0] = MEMORY[0x1E0C809B0];
        v100[1] = 3221225472;
        v100[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_997;
        v100[3] = &unk_1E9F9A7A8;
        v52 = &v101;
        objc_copyWeak(&v101, from);
        objc_msgSend(v49, "actionWithTitle:style:handler:", v51, 0, v100);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = (void *)MEMORY[0x1E0DC3448];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringForKey:", CFSTR("DIGITAL_ADAPTER_COMPATIBILITY_WARNING_ACTION_STREAM"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v98[0] = MEMORY[0x1E0C809B0];
        v98[1] = 3221225472;
        v98[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1000;
        v98[3] = &unk_1E9F9A7A8;
        v57 = &v99;
        objc_copyWeak(&v99, from);
        objc_msgSend(v54, "actionWithTitle:style:handler:", v56, 0, v98);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = (void *)MEMORY[0x1E0DC3448];
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "localizedStringForKey:", CFSTR("DIGITAL_ADAPTER_COMPATIBILITY_WARNING_ACTION_CANCEL"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v96[0] = MEMORY[0x1E0C809B0];
        v96[1] = 3221225472;
        v96[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_1003;
        v96[3] = &unk_1E9F9A7A8;
        objc_copyWeak(&v97, from);
        objc_msgSend(v58, "actionWithTitle:style:handler:", v60, 0, v96);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v53;
        v61 = &v97;
        goto LABEL_32;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "code") == 808)
      {
        v65 = objc_loadWeakRetained(from);
        objc_msgSend(v65, "activePlayer");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "currentMediaItem");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v68 = objc_msgSend(v35, "isEqualToString:", *MEMORY[0x1E0DB1DD8]);
        if (MGGetBoolAnswer())
        {
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "localizedStringForKey:", CFSTR("CONNECT_TO_WLAN_TO_WATCH_ERROR_TITLE"));
          v38 = objc_claimAutoreleasedReturnValue();

          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          if ((v68 & 1) != 0)
            goto LABEL_13;
          goto LABEL_47;
        }
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "localizedStringForKey:", CFSTR("CONNECT_TO_WIFI_TO_WATCH_ERROR_TITLE"));
        v38 = objc_claimAutoreleasedReturnValue();

        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        if ((v68 & 1) != 0)
        {
LABEL_43:
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringForKey:", CFSTR("CONNECT_TO_WIFI_TO_PLAYBACK_ERROR_MESSAGE_EPISODE"));
          goto LABEL_44;
        }
LABEL_48:
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:", CFSTR("CONNECT_TO_WIFI_TO_PLAYBACK_ERROR_MESSAGE_MOVIE"));
        goto LABEL_44;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "code") == 811)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedStringForKey:", CFSTR("ContentNotAuthorizedErrorDescription"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "code") == 835)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedStringForKey:", CFSTR("SCREEN_BEING_RECORDED_ERROR_MESSAGE_BODY"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "code") == 830)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedStringForKey:", CFSTR("AIRPLAY_HLS_RENTAL_ERROR_MESSAGE_BODY"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "code") == 831)
      {
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedStringForKey:", CFSTR("AIRPLAY_RENTAL_DOWNLOAD_BEFORE_USE_MESSAGE"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(*(id *)(a1 + 32), "code") != 832)
        {
          if (objc_msgSend(*(id *)(a1 + 32), "code") != 807)
          {
            v21 = 0;
            v22 = 0;
            v20 = 0;
            v88 = v85;
            goto LABEL_5;
          }
          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "localizedStringForKey:", CFSTR("HDCP_PROTECTION_ERROR_TITLE"));
          v38 = objc_claimAutoreleasedReturnValue();

          +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "localizedStringForKey:", CFSTR("HDCP_PROTECTION_ERROR_BODY"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_39;
        }
        +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedStringForKey:", CFSTR("AIRPLAY_RENTAL_WAIT_FOR_DOWNLOAD_BEFORE_USE_MESSAGE"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    v21 = 0;
    v22 = 0;
    v20 = 0;
    goto LABEL_5;
  }
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:", CFSTR("CANNOT_STREAM_VIDEO_ALERT_TITLE"));
  v11 = objc_claimAutoreleasedReturnValue();

  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:", CFSTR("CANNOT_STREAM_VIDEO_ALERT_MESSAGE"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:", CFSTR("CANNOT_STREAM_VIDEO_ALERT_ACTION_CLOSE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = MEMORY[0x1E0C809B0];
  v110[1] = 3221225472;
  v110[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_953;
  v110[3] = &unk_1E9F9A7A8;
  objc_copyWeak(&v111, from);
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v110);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0DC3448];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:", CFSTR("CANNOT_STREAM_VIDEO_ALERT_ACTION_SETTINGS"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = MEMORY[0x1E0C809B0];
  v108[1] = 3221225472;
  v108[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_956;
  v108[3] = &unk_1E9F9A7A8;
  objc_copyWeak(&v109, from);
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, v108);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v109);
  objc_destroyWeak(&v111);
  v21 = 0;
  v22 = 0;
  v5 = (void *)v16;
  v8 = (void *)v11;
LABEL_5:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_1022;
  aBlock[3] = &unk_1E9F9D920;
  v23 = v5;
  v90 = v23;
  v24 = v20;
  v91 = v24;
  v25 = v21;
  v92 = v25;
  v26 = v22;
  v93 = v26;
  objc_copyWeak(&v95, from);
  v94 = *(id *)(v86 + 40);
  v27 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  if (objc_msgSend(v8, "length") || objc_msgSend(v88, "length"))
  {
    v27[2](v27, v8, v88);
  }
  else
  {
    v40 = objc_loadWeakRetained(from);
    objc_msgSend(v40, "activePlayer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41
      && (objc_msgSend(v41, "currentMediaItem"),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          v42,
          v42))
    {
      +[VUIPlaybackErrorMessage sharedInstance](VUIPlaybackErrorMessage, "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "currentMediaItem");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "getLocalizedErrorMessageFor:withError:completion:", v44, *(_QWORD *)(v86 + 32), v27);
    }
    else
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance", v84);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:", CFSTR("AV_PLAYBACK_ERROR"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2](v27, v8, v44);
    }

  }
  objc_destroyWeak(&v95);

  objc_destroyWeak(v114);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_943(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("TVPlaybackErrorDomain")) & 1) == 0)
  {

    goto LABEL_5;
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "code");

  if (v3 != 813)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v7 = CFSTR("PerformAuthAfterDismissingErrorKey");
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Error alert dismissed"), 0, v4);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_953(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Error alert dismissed"));

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_956(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Error alert dismissed"));

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=USAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_982(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCellularDataPlaybackEnabled:", 1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:", CFSTR("Play using cellular data button pressed"));

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_985(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Play using cellular data button pressed"));

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_988(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Error alert dismissed"));

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_997(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Download compatible video button pressed"));

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1000(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Force streaming video button pressed"));

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_11_1003(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Error alert dismissed"));

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_12_1022(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a2, a3, 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v15, "addAction:");
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v15, "addAction:");
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v15, "addAction:");
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(v15, "setPreferredAction:");
  v4 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "setErrorAlertController:", v15);

  if (*(__CFString **)(a1 + 64) != CFSTR("Showing error message on playback UI"))
    goto LABEL_10;
  v9 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v9, "avPlayerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v6 = objc_loadWeakRetained(v4);
    objc_msgSend(v6, "avPlayerViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vui_viewControllerForFullScreenPresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentViewController:animated:completion:", v15, 1, 0);

  }
  else
  {
LABEL_10:
    +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appWindow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "rootViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "presentViewController:animated:completion:", v15, 1, 0);
  }

}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_13_1027(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  __CFString *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  char v31;
  char v32;
  uint8_t buf[16];

  v7 = a5;
  objc_msgSend(a2, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Showing error message on playback UI")) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v11, "extrasAVPlayerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v12)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("PerformAuthAfterDismissingErrorKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("StartDownloadAfterDismissingErrorKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  v18 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v18, "activePlayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentMediaItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "Will dismiss AVPlayerViewController since error alert has been dismissed", buf, 2u);
  }
  v22 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v22, "stateMachine");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1028;
  v27[3] = &unk_1E9F9D9D0;
  v29 = *(id *)(a1 + 40);
  v31 = v15;
  v32 = v17;
  v30 = *(id *)(a1 + 48);
  v28 = v20;
  v24 = v20;
  objc_msgSend(v23, "executeBlockAfterCurrentStateTransition:", v27);

  v13 = CFSTR("Not showing anything");
LABEL_8:
  v25 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v25, "setErrorAlertController:", 0);

  return v13;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1028(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  __int16 v7;

  +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isFeatureEnabled:", &__block_literal_global_1031);

  +[VideosUI markLastPlaybackEventasError](_TtC8VideosUI8VideosUI, "markLastPlaybackEventasError");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1033;
  v4[3] = &unk_1E9F9D9A8;
  v7 = *(_WORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD *))(v3 + 16))(v3, 1, 1, 0, 1, 1, 1, v4);

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1030(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setLastPlaybackEvent:", 1);

  }
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1033(uint64_t a1)
{
  NSObject *v1;
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[16];

  if (*(_BYTE *)(a1 + 48))
  {
    v1 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v1, OS_LOG_TYPE_DEFAULT, "Performing auth", buf, 2u);
    }
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:withCompletionHandler:](VUIAuthenticationManager, "requestAuthenticationAlwaysPrompt:withCompletionHandler:", 1, &__block_literal_global_1036);
  }
  else if (*(_BYTE *)(a1 + 49))
  {
    v3 = dispatch_time(0, 1000000000);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1037;
    v4[3] = &unk_1E9F99420;
    v6 = *(id *)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1037(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1038(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferAVAdapterCompatibility:", 1);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1040;
  v7[3] = &unk_1E9F98DF0;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v4, "executeBlockAfterCurrentStateTransition:", v7);
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1040(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("StartDownloadAfterDismissingErrorKey");
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Error alert dismissed"), 0, v2);

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1041(id *a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferAVAdapterCompatibility:", 1);

  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "activePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaItemMetadata:forProperty:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DB1AE8]);

  v6 = objc_loadWeakRetained(a1);
  objc_msgSend(v6, "activePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "play");

  return CFSTR("Showing video full screen");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1042(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "mainPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsCellularUsage:", 1);

  v15 = objc_loadWeakRetained(a1);
  objc_msgSend(v15, "extrasPlayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAllowsCellularUsage:", 1);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1043;
  v18[3] = &unk_1E9F99C98;
  objc_copyWeak(&v19, a1);
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v18);
  objc_destroyWeak(&v19);

  return CFSTR("Showing video full screen");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1043(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activePlayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "play");

}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_8_1044(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD);
  id v5;
  id WeakRetained;
  void *v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
  v5 = a2;
  v4(v3, 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performEnterBackgroundOperations");

  objc_msgSend(v5, "currentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_9_1045(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performEnterBackgroundOperations");

  objc_msgSend(v3, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_10_1046(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  __CFString *v11;
  id WeakRetained;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  BOOL v37;
  id v38;
  void *v39;
  id v40;
  int v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  uint8_t buf[16];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v48 = a3;
  v49 = a4;
  v10 = a5;
  objc_msgSend(v9, "currentState");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "configuredPostPlay") & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v13, "activePlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "externalPlaybackType");

    if (v15)
    {
      v16 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v16, "activePlayer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentMediaItem");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CE0]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v19 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v19, "activePlayer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "playlist");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "activeList");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v54;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v54 != v24)
                objc_enumerationMutation(v22);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "isEqualToMediaItem:", v18) & 1) != 0)
              {

                v26 = objc_loadWeakRetained((id *)(a1 + 40));
                objc_msgSend(v26, "activePlayer");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "playlist");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v28, "activeListIndex");

                v29 = sLogObject_5;
                if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "removing post play item in playlist", buf, 2u);
                }
                v22 = objc_loadWeakRetained((id *)(a1 + 40));
                objc_msgSend(v22, "activePlayer");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "playlist");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "removeItemAtIndex:", v46 + 1);

                goto LABEL_17;
              }
            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
            if (v23)
              continue;
            break;
          }
        }
LABEL_17:

      }
      v32 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v32, "featureMonitor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "featuresForType:", 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
        goto LABEL_27;
      if (!objc_msgSend(v35, "isActive"))
        goto LABEL_27;
      objc_msgSend(v9, "currentState");
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v37 = v36 == CFSTR("Showing video full screen with post play content on screen");

      if (v37)
        goto LABEL_27;
      v38 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v38, "postPlayView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {

      }
      else
      {
        v40 = objc_loadWeakRetained((id *)(a1 + 40));
        v41 = objc_msgSend(v40, "_isNewPostPlayEnabled");

        if (!v41)
        {
LABEL_27:

          goto LABEL_28;
        }
      }
      v42 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v42, "avPlayerViewController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "view");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        v11 = CFSTR("Showing video full screen with post play content on screen");
      }

      goto LABEL_27;
    }
  }
  else
  {

  }
LABEL_28:
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1047;
  v50[3] = &unk_1E9F99C98;
  objc_copyWeak(&v51, (id *)(a1 + 40));
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v50);
  objc_destroyWeak(&v51);

  return v11;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1047(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performEnterForegroundOperations");

}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1048(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "avPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);

  objc_msgSend(v4, "currentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1049(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1050;
  v15[3] = &unk_1E9F99C98;
  objc_copyWeak(&v16, (id *)(a1 + 32));
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v15);
  objc_msgSend(v9, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v16);

  return v13;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1050(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performEnterForegroundOperations");

}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1051(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "backgroundAudioPlayer");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_4;
  v7 = (void *)v6;
  v8 = objc_loadWeakRetained(v4);
  objc_msgSend(v8, "backgroundAudioPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
  {
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "backgroundAudioPlayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pause");

LABEL_4:
  }
  objc_msgSend(v3, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_1052(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  __CFString *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "avPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  v12 = objc_loadWeakRetained(v3);
  objc_msgSend(v12, "extrasContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v13, "shouldExtrasBeVisibleForSize:", v9, v11);

  objc_msgSend(v4, "currentState");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!(_DWORD)v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v22 = objc_loadWeakRetained(v3);
    objc_msgSend(v22, "_setExtrasButtonVisible:", 0);
    v15 = v14;
    v14 = CFSTR("Showing video full screen");
    goto LABEL_6;
  }
  v15 = objc_loadWeakRetained(v3);
  objc_msgSend(v15, "backgroundAudioPlayer");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_7:

    return v14;
  }
  v17 = (void *)v16;
  v18 = objc_loadWeakRetained(v3);
  objc_msgSend(v18, "backgroundAudioPlayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "state");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 == v21)
  {
    v15 = objc_loadWeakRetained(v3);
    objc_msgSend(v15, "backgroundAudioPlayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "play");
LABEL_6:

    goto LABEL_7;
  }
  return v14;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_7_1053(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "external playback did change", buf, 2u);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "multiviewPlaybackInfo", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v20, "pausedDueToInterruption"))
        {
          objc_msgSend(v20, "player");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "play");

          objc_msgSend(v20, "setPausedDueToInterruption:", 0);
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v17);
  }

  objc_msgSend(v9, "currentState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1054(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "activePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentMediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v4, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1055(uint64_t a1, void *a2)
{
  __CFString *v3;
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "currentState");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v33 = a1;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setConfiguredPostPlay:", 1);

  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "featureMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "featuresForType:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v10, "featureMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "featuresForType:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v17);
        v19 = objc_loadWeakRetained(v4);
        objc_msgSend(v19, "featureMonitor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deactivateFeature:animated:", v18, 0);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v15);
  }

  if (v9)
  {
    if (objc_msgSend(v9, "isActive"))
    {
      v21 = objc_loadWeakRetained(v4);
      objc_msgSend(v21, "activePlayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "state");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DB1958], "playing");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 == v24)
      {
        v25 = objc_loadWeakRetained(v4);
        v26 = objc_msgSend(v25, "_isNewPostPlayEnabled");

        if (v26)
        {
          (*(void (**)(void))(*(_QWORD *)(v33 + 32) + 16))();
          v27 = v3;
          goto LABEL_16;
        }
        v28 = objc_loadWeakRetained(v4);
        objc_msgSend(v28, "postPlayView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v30 = objc_loadWeakRetained(v4);
          objc_msgSend(v30, "avPlayerViewController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "view");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
          {
LABEL_17:

            goto LABEL_18;
          }
          (*(void (**)(void))(*(_QWORD *)(v33 + 32) + 16))();

LABEL_16:
          v3 = CFSTR("Showing video full screen with post play content on screen");
          goto LABEL_17;
        }
      }
    }
  }
LABEL_18:

  return v3;
}

__CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1056(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;

  objc_msgSend(a2, "currentState");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!objc_msgSend(WeakRetained, "configuredPostPlay"))
  {
LABEL_9:

    return v3;
  }
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "activePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "postPlayView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      v11 = objc_loadWeakRetained((id *)(a1 + 40));
      v12 = objc_msgSend(v11, "_isNewPostPlayEnabled");

      if (!v12)
        return v3;
    }
    v13 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v13, "activePlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "externalPlaybackType");

    if (!v15)
    {
      v16 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v16, "avPlayerViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "view");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

      if (WeakRetained)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        v3 = CFSTR("Showing video full screen with post play content on screen");
      }
      goto LABEL_9;
    }
  }
  return v3;
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1057(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;
  id *v9;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint8_t v24[16];

  v6 = a5;
  objc_msgSend(v6, "objectForKey:", CFSTR("PostPlaySlideOutAnimationKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("PostPlaySlideOutAnimationKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "BOOLValue");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "_resetAutoPlayBingeWatchingQualifications");

  v11 = objc_loadWeakRetained(v9);
  objc_msgSend(v11, "activePlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playlist");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "activeListIndex");

  v15 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Removing post play item from playlist", v24, 2u);
  }
  v16 = objc_loadWeakRetained(v9);
  objc_msgSend(v16, "activePlayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "playlist");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nextMediaItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_loadWeakRetained(v9);
    objc_msgSend(v20, "activePlayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "playlist");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeItemAtIndex:", v14 + 1);

  }
  return CFSTR("Showing video full screen");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1058(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  __CFString *v42;
  id v43;
  void *v44;
  int v45;
  __CFString **v46;
  __CFString **v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  int v58;
  __CFString *v59;
  uint64_t v60;
  void *v61;
  id v62;
  __CFString *v63;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  __CFString *v76;
  id v77;
  uint8_t buf[16];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v13 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "activePlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentMediaItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "mediaItemMetadataForProperty:", CFSTR("VUIMediaItemMetadataUpNextPostPlayMediaInfo"));
  v68 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CE0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPostPlayItemUpsellRouterDataSource"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPostPlayItemMetrics"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v66 = v18;
    objc_msgSend(v17, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addOrReplaceStartEventWithName:date:", *MEMORY[0x1E0DB1F10], 0);
    v65 = v19;
    objc_msgSend(v19, "addOrReplaceStartEventWithName:date:", *MEMORY[0x1E0DB1F28], 0);
    v20 = objc_loadWeakRetained(v13);
    objc_msgSend(v20, "ratingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = objc_loadWeakRetained(v13);
      objc_msgSend(v22, "ratingView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeFromSuperview");

    }
    v24 = objc_loadWeakRetained(v13);
    objc_msgSend(v24, "setRatingImage:", 0);

    v25 = objc_loadWeakRetained(v13);
    objc_msgSend(v25, "setRatingView:", 0);

    v26 = objc_loadWeakRetained(v13);
    objc_msgSend(v26, "setPhotoSensitivityImage:", 0);

    v27 = objc_loadWeakRetained(v13);
    objc_msgSend(v27, "productPlacementView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = objc_loadWeakRetained(v13);
      objc_msgSend(v29, "productPlacementView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeFromSuperview");

    }
    v31 = objc_loadWeakRetained(v13);
    objc_msgSend(v31, "setProductPlacementImage:", 0);

    v32 = objc_loadWeakRetained(v13);
    objc_msgSend(v32, "setProductPlacementView:", 0);

    v33 = objc_loadWeakRetained(v13);
    v34 = (void *)objc_opt_new();
    objc_msgSend(v33, "setLogoImageDownloader:", v34);

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("Post play item selected")))
    {
      if (v69)
      {
        objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("VUIContentMetadataPostPlayItemMetricsClickDataKey"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "recordClick:", v35);

      }
      v37 = objc_loadWeakRetained(v13);
      objc_msgSend(v37, "_resetAutoPlayBingeWatchingQualifications");

    }
    v38 = v12;
    v67 = v11;
    v39 = v10;
    v40 = v9;
    v41 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v41, OS_LOG_TYPE_DEFAULT, "Playing post play item from playlist", buf, 2u);
    }
    v42 = (__CFString *)(id)*MEMORY[0x1E0DB1DF8];
    v43 = objc_loadWeakRetained(v13);
    objc_msgSend(v43, "postPlayView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "canAutoPlay");

    v10 = v39;
    if ((objc_msgSend(v39, "isEqualToString:", CFSTR("Post play item selected")) & 1) != 0)
    {
      v46 = VUIPostPlayReasonManualPlayOther;
      v47 = &VUIPostPlayReasonManualUpNext;
      v12 = v38;
    }
    else
    {
      v58 = objc_msgSend(v39, "isEqualToString:", CFSTR("Post play auto play timer did complete"));
      v12 = v38;
      if (!v58)
      {
        v57 = (void *)v68;
LABEL_24:
        +[VUIMetricsMediaEvent recordPlayOfTVPMediaItem:](VUIMetricsMediaEvent, "recordPlayOfTVPMediaItem:", v17);
        if (objc_msgSend(v57, "playbackContext") == 7)
          v60 = 4;
        else
          v60 = 3;
        +[VUIPlaybackStartupCoordinator startupCoordinatorWithMediaInfo:watchType:isRentAndWatchNow:](VUIPlaybackStartupCoordinator, "startupCoordinatorWithMediaInfo:watchType:isRentAndWatchNow:", v57, v60, 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1059;
        v73[3] = &unk_1E9F9DA40;
        v62 = v61;
        v74 = v62;
        v75 = v17;
        objc_copyWeak(&v77, v13);
        v63 = v42;
        v76 = v63;
        objc_msgSend(v62, "performPlaybackStartupFlowWithCompletion:", v73);

        objc_destroyWeak(&v77);
        v55 = CFSTR("Showing video full screen");
        v9 = v40;
        v18 = v66;
        v11 = v67;
        v56 = v65;
        goto LABEL_28;
      }
      v46 = VUIPostPlayReasonAutomaticPlayOther;
      v47 = VUIPostPlayReasonAutomaticUpNext;
    }
    v57 = (void *)v68;
    if (v45)
      v46 = v47;
    v59 = *v46;

    v42 = v59;
    goto LABEL_24;
  }
  if (!v18)
  {
    v55 = CFSTR("Showing video full screen");
    v57 = (void *)v68;
    goto LABEL_29;
  }
  v48 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v48, "stateMachine");
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = v18;
  v51 = (void *)v49;
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1060;
  v70[3] = &unk_1E9F99D58;
  v52 = v50;
  v71 = v50;
  v72 = *(id *)(a1 + 40);
  objc_msgSend(v51, "executeBlockAfterCurrentStateTransition:", v70);

  if (v69)
  {
    objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("VUIContentMetadataPostPlayItemMetricsClickDataKey"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "recordClick:", v53);

  }
  v55 = CFSTR("Not showing anything");
  v56 = v71;
  v57 = (void *)v68;
  v18 = v52;
LABEL_28:

LABEL_29:
  return v55;
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1059(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, void *a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  const __CFString *v25;
  NSObject *v26;
  id v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  id *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  id WeakRetained;
  void *v40;
  id v41;
  void *v42;
  int v43;
  const __CFString *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    v43 = 134218752;
    v44 = (const __CFString *)a2;
    v45 = 2048;
    v46 = a3;
    v47 = 2048;
    v48 = a4;
    v49 = 2048;
    v50 = a5;
    _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "Post-play startup coordinator finished startup flow.  startPlayback == %ld, isCoWatching == %ld, forceDownloadToStream == %ld, allowCellular == %ld", (uint8_t *)&v43, 0x2Au);
  }
  v19 = sLogObject_5;
  v20 = os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v20)
    {
      LOWORD(v43) = 0;
      _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Playing post-play media item since playback startup coordinator allowed it", (uint8_t *)&v43, 2u);
      if (!a4)
      {
LABEL_6:
        if (a3)
        {
LABEL_7:
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0DC6AF8]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v22, "BOOLValue") & 1) == 0)
          {
            v23 = objc_msgSend(v22, "BOOLValue");
            v24 = sLogObject_5;
            if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
            {
              v25 = CFSTR("paused");
              if (v23)
                v25 = CFSTR("playing");
              v43 = 138412290;
              v44 = v25;
              _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "Overriding initial playback state to %@ per user default", (uint8_t *)&v43, 0xCu);
            }
            if (!v23)
            {
              v38 = sLogObject_5;
              if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v43) = 0;
                _os_log_impl(&dword_1D96EE000, v38, OS_LOG_TYPE_DEFAULT, "GroupActivities session is active, starting next item in paused state", (uint8_t *)&v43, 2u);
              }
              WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
              objc_msgSend(WeakRetained, "mainPlayer");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "pause");

              v41 = objc_loadWeakRetained((id *)(a1 + 56));
              objc_msgSend(v41, "mainPlayer");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "pause");

              v31 = 0;
              goto LABEL_27;
            }
          }
          v26 = sLogObject_5;
          if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v43) = 0;
            _os_log_impl(&dword_1D96EE000, v26, OS_LOG_TYPE_DEFAULT, "GroupActivities session is active, starting next item in playing state", (uint8_t *)&v43, 2u);
          }
          v27 = objc_loadWeakRetained((id *)(a1 + 56));
          objc_msgSend(v27, "mainPlayer");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "play");

LABEL_26:
          v31 = 1;
LABEL_27:
          v32 = (id *)(a1 + 56);
          v33 = objc_loadWeakRetained((id *)(a1 + 56));
          objc_msgSend(v33, "activePlayer");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "changeMediaInDirection:reason:", 0, *(_QWORD *)(a1 + 48));

          if (v31)
          {
            v35 = objc_loadWeakRetained((id *)(a1 + 56));
            objc_msgSend(v35, "mainPlayer");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "play");

          }
          v37 = objc_loadWeakRetained(v32);
          objc_msgSend(v37, "_notifyAVPlayerViewControllerDisplaySize");

          goto LABEL_30;
        }
LABEL_24:
        v30 = sLogObject_5;
        if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v43) = 0;
          _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "No GroupActivity is active.  Starting next item in playing state", (uint8_t *)&v43, 2u);
        }
        goto LABEL_26;
      }
    }
    else if (!a4)
    {
      goto LABEL_6;
    }
    v29 = sLogObject_5;
    if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v43) = 0;
      _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "Forcing downloaded video to be streamed.  Removing previously added up next item", (uint8_t *)&v43, 2u);
    }
    objc_msgSend(*(id *)(a1 + 40), "setMediaItemMetadata:forProperty:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DB1AE8]);
    if (a3)
      goto LABEL_7;
    goto LABEL_24;
  }
  if (v20)
  {
    LOWORD(v43) = 0;
    _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "Not playing post-play media item since playback startup coordinator disallowed it", (uint8_t *)&v43, 2u);
  }
LABEL_30:

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1060(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD aBlock[4];
  id v5;
  uint8_t buf[16];

  v2 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Tear down playback and present post play upsell screen", buf, 2u);
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1061;
  aBlock[3] = &unk_1E9F98DF0;
  v5 = *(id *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1061(uint64_t a1)
{
  id v2;

  +[VUIPostPlayUpsellManager sharedInstance](VUIPostPlayUpsellManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleRouterDataSourceIfNeeded:", *(_QWORD *)(a1 + 32));

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1063(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "activePlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v16, "activePlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "elapsedTime");
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v20, VUIPlaybackManagerNotificationKeyElapsedTime);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = VUIPlaybackManagerPostPlayPIPWillHideNotification[0];
  v23 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v21, "postNotificationName:object:userInfo:", v22, 0, v23);

  v24 = *(_QWORD *)(a1 + 32);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1064;
  v26[3] = &unk_1E9F99C98;
  objc_copyWeak(&v27, (id *)(a1 + 40));
  (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD *))(v24 + 16))(v24, 1, 0, 1, 1, 0, 0, v26);
  objc_destroyWeak(&v27);

  return CFSTR("Showing post play content without playback UI");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1064(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hidePictureInPictureWithCompletion:", 0);

}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1065(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = sLogObject_5;
  if (os_log_type_enabled((os_log_t)sLogObject_5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up player because post play view was dimissed", v4, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return CFSTR("Not showing anything");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_1066()
{
  return CFSTR("Playing background media in picture and picture");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_2_1068(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPIPedBackgroundMediaController:", 0);

  return CFSTR("Not showing anything");
}

const __CFString *__51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_1069(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKey:", CFSTR("CompletionKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1070;
  v16[3] = &unk_1E9F9DAB0;
  objc_copyWeak(&v19, (id *)(a1 + 40));
  v17 = *(id *)(a1 + 32);
  v14 = v13;
  v18 = v14;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v16);

  objc_destroyWeak(&v19);
  return CFSTR("Transferring player to background media");
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_1070(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "playbackContainerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "mainAVPlayerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "setDelegate:", v7);

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "activePlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1071;
  v14[3] = &unk_1E9F9D6B8;
  objc_copyWeak(&v19, v2);
  v18 = *(id *)(a1 + 40);
  v11 = v4;
  v15 = v11;
  v12 = v6;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD *))(v10 + 16))(v10, 0, 0, 1, 0, 0, 0, v14);

  objc_destroyWeak(&v19);
}

uint64_t __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_5_1071(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "setPresentingViewController:", 0);

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (VUIPlayer)activePlayer
{
  return (VUIPlayer *)objc_loadWeakRetained((id *)&self->_activePlayer);
}

- (VUIPlayer)mainPlayer
{
  return self->_mainPlayer;
}

- (void)setMainPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_mainPlayer, a3);
}

- (VUIPlayer)backgroundAudioPlayer
{
  return self->_backgroundAudioPlayer;
}

- (void)setBackgroundAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundAudioPlayer, a3);
}

- (NSMutableArray)multiviewPlaybackInfo
{
  return self->_multiviewPlaybackInfo;
}

- (void)setMultiviewPlaybackInfo:(id)a3
{
  objc_storeStrong((id *)&self->_multiviewPlaybackInfo, a3);
}

- (VUIPlayer)extrasPlayer
{
  return self->_extrasPlayer;
}

- (void)setExtrasPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_extrasPlayer, a3);
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (VideosExtrasContext)extrasContext
{
  return self->_extrasContext;
}

- (void)setExtrasContext:(id)a3
{
  objc_storeStrong((id *)&self->_extrasContext, a3);
}

- (AVPlayerViewController)avPlayerViewController
{
  return self->_avPlayerViewController;
}

- (AVPlayerViewController)mainAVPlayerViewController
{
  return self->_mainAVPlayerViewController;
}

- (void)setMainAVPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mainAVPlayerViewController, a3);
}

- (AVPlayerViewController)extrasAVPlayerViewController
{
  return self->_extrasAVPlayerViewController;
}

- (void)setExtrasAVPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_extrasAVPlayerViewController, a3);
}

- (VUIControllerPresenter)presentingViewController
{
  return (VUIControllerPresenter *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (int64_t)dismissalOperation
{
  return self->_dismissalOperation;
}

- (void)setDismissalOperation:(int64_t)a3
{
  self->_dismissalOperation = a3;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  self->_requiresLinearPlayback = a3;
}

- (NSDictionary)savedErrorUserInfo
{
  return self->_savedErrorUserInfo;
}

- (void)setSavedErrorUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_savedErrorUserInfo, a3);
}

- (id)savedErrorContext
{
  return self->_savedErrorContext;
}

- (void)setSavedErrorContext:(id)a3
{
  objc_storeStrong(&self->_savedErrorContext, a3);
}

- (OS_dispatch_queue)audioSessionSerialQueue
{
  return self->_audioSessionSerialQueue;
}

- (void)setAudioSessionSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionSerialQueue, a3);
}

- (UIAlertController)errorAlertController
{
  return self->_errorAlertController;
}

- (void)setErrorAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_errorAlertController, a3);
}

- (VUIPlaybackContainerViewController)playbackContainerViewController
{
  return self->_playbackContainerViewController;
}

- (void)setPlaybackContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackContainerViewController, a3);
}

- (VUIMultiPlayerViewController)multiPlayerViewController
{
  return self->_multiPlayerViewController;
}

- (void)setMultiPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_multiPlayerViewController, a3);
}

- (VUIMultiPlayerDetailsViewController)multiPlayerDetailsViewController
{
  return self->_multiPlayerDetailsViewController;
}

- (void)setMultiPlayerDetailsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_multiPlayerDetailsViewController, a3);
}

- (NSDate)dateAppWasBackgrounded
{
  return self->_dateAppWasBackgrounded;
}

- (void)setDateAppWasBackgrounded:(id)a3
{
  objc_storeStrong((id *)&self->_dateAppWasBackgrounded, a3);
}

- (NSDate)datePlaybackWasPaused
{
  return self->_datePlaybackWasPaused;
}

- (void)setDatePlaybackWasPaused:(id)a3
{
  objc_storeStrong((id *)&self->_datePlaybackWasPaused, a3);
}

- (NSTimer)pausedTooLongTimer
{
  return self->_pausedTooLongTimer;
}

- (void)setPausedTooLongTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pausedTooLongTimer, a3);
}

- (BOOL)shouldRestartIfAppHasBeenBackgroundedTooLong
{
  return self->_shouldRestartIfAppHasBeenBackgroundedTooLong;
}

- (void)setShouldRestartIfAppHasBeenBackgroundedTooLong:(BOOL)a3
{
  self->_shouldRestartIfAppHasBeenBackgroundedTooLong = a3;
}

- (BOOL)isTrackingPlayerViewFrame
{
  return self->_trackingPlayerViewFrame;
}

- (void)setTrackingPlayerViewFrame:(BOOL)a3
{
  self->_trackingPlayerViewFrame = a3;
}

- (UIActivityItemsConfiguration)itemsConfiguration
{
  return self->_itemsConfiguration;
}

- (void)setItemsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_itemsConfiguration, a3);
}

- (UIViewController)PIPedBackgroundMediaController
{
  return self->_PIPedBackgroundMediaController;
}

- (void)setPIPedBackgroundMediaController:(id)a3
{
  objc_storeStrong((id *)&self->_PIPedBackgroundMediaController, a3);
}

- (VideosExtrasPresenter)extrasPresenter
{
  return self->_extrasPresenter;
}

- (void)setExtrasPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_extrasPresenter, a3);
}

- (VUINowPlayingFeatureMonitor)featureMonitor
{
  return self->_featureMonitor;
}

- (void)setFeatureMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_featureMonitor, a3);
}

- (VUIPostPlayView)postPlayView
{
  return self->_postPlayView;
}

- (void)setPostPlayView:(id)a3
{
  objc_storeStrong((id *)&self->_postPlayView, a3);
}

- (NSLayoutConstraint)postPlayTrailingConstraint
{
  return self->_postPlayTrailingConstraint;
}

- (void)setPostPlayTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_postPlayTrailingConstraint, a3);
}

- (unint64_t)autoPlayedVideosCount
{
  return self->_autoPlayedVideosCount;
}

- (void)setAutoPlayedVideosCount:(unint64_t)a3
{
  self->_autoPlayedVideosCount = a3;
}

- (NSDate)initialPlaybackStartDate
{
  return self->_initialPlaybackStartDate;
}

- (void)setInitialPlaybackStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_initialPlaybackStartDate, a3);
}

- (BOOL)configuredPostPlay
{
  return self->_configuredPostPlay;
}

- (void)setConfiguredPostPlay:(BOOL)a3
{
  self->_configuredPostPlay = a3;
}

- (NSNumber)postPlayImpressionTime
{
  return self->_postPlayImpressionTime;
}

- (void)setPostPlayImpressionTime:(id)a3
{
  objc_storeStrong((id *)&self->_postPlayImpressionTime, a3);
}

- (NSDictionary)skipButtonImpressionMetrics
{
  return self->_skipButtonImpressionMetrics;
}

- (void)setSkipButtonImpressionMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_skipButtonImpressionMetrics, a3);
}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
  objc_storeStrong((id *)&self->_skipButton, a3);
}

- (NSLayoutConstraint)skipCenterXConstraint
{
  return self->_skipCenterXConstraint;
}

- (void)setSkipCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_skipCenterXConstraint, a3);
}

- (NSLayoutConstraint)skipBottomConstraint
{
  return self->_skipBottomConstraint;
}

- (void)setSkipBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_skipBottomConstraint, a3);
}

- (NSLayoutConstraint)skipTrailingConstraint
{
  return self->_skipTrailingConstraint;
}

- (void)setSkipTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_skipTrailingConstraint, a3);
}

- (VUIPromoMetadataView)promoMetadataView
{
  return self->_promoMetadataView;
}

- (void)setPromoMetadataView:(id)a3
{
  objc_storeStrong((id *)&self->_promoMetadataView, a3);
}

- (NSDictionary)upNextButtonImpressionMetrics
{
  return self->_upNextButtonImpressionMetrics;
}

- (void)setUpNextButtonImpressionMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_upNextButtonImpressionMetrics, a3);
}

- (VUIVideoAdvisoryLogoImageDownloader)logoImageDownloader
{
  return self->_logoImageDownloader;
}

- (void)setLogoImageDownloader:(id)a3
{
  objc_storeStrong((id *)&self->_logoImageDownloader, a3);
}

- (UIImage)ratingImage
{
  return self->_ratingImage;
}

- (void)setRatingImage:(id)a3
{
  objc_storeStrong((id *)&self->_ratingImage, a3);
}

- (UIImage)photoSensitivityImage
{
  return self->_photoSensitivityImage;
}

- (void)setPhotoSensitivityImage:(id)a3
{
  objc_storeStrong((id *)&self->_photoSensitivityImage, a3);
}

- (UIImage)highMotionWarningImage
{
  return self->_highMotionWarningImage;
}

- (void)setHighMotionWarningImage:(id)a3
{
  objc_storeStrong((id *)&self->_highMotionWarningImage, a3);
}

- (VUIAdditionalAdvisoryInfoView)hmwView
{
  return self->_hmwView;
}

- (void)setHmwView:(id)a3
{
  objc_storeStrong((id *)&self->_hmwView, a3);
}

- (VUIVideoAdvisoryView)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
  objc_storeStrong((id *)&self->_ratingView, a3);
}

- (BOOL)shouldDisplayTVRatingWhenVideoBoundsIsAvailable
{
  return self->_shouldDisplayTVRatingWhenVideoBoundsIsAvailable;
}

- (void)setShouldDisplayTVRatingWhenVideoBoundsIsAvailable:(BOOL)a3
{
  self->_shouldDisplayTVRatingWhenVideoBoundsIsAvailable = a3;
}

- (BOOL)shouldAnimateTVRatingView
{
  return self->_shouldAnimateTVRatingView;
}

- (void)setShouldAnimateTVRatingView:(BOOL)a3
{
  self->_shouldAnimateTVRatingView = a3;
}

- (UIVisualEffectView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (UIImage)productPlacementImage
{
  return self->_productPlacementImage;
}

- (void)setProductPlacementImage:(id)a3
{
  objc_storeStrong((id *)&self->_productPlacementImage, a3);
}

- (VUIProductPlacementView)productPlacementView
{
  return self->_productPlacementView;
}

- (void)setProductPlacementView:(id)a3
{
  objc_storeStrong((id *)&self->_productPlacementView, a3);
}

- (BOOL)shouldDisplayProductPlacementWhenVideoBoundsIsAvailable
{
  return self->_shouldDisplayProductPlacementWhenVideoBoundsIsAvailable;
}

- (void)setShouldDisplayProductPlacementWhenVideoBoundsIsAvailable:(BOOL)a3
{
  self->_shouldDisplayProductPlacementWhenVideoBoundsIsAvailable = a3;
}

- (BOOL)shouldAnimateProductPlacementView
{
  return self->_shouldAnimateProductPlacementView;
}

- (void)setShouldAnimateProductPlacementView:(BOOL)a3
{
  self->_shouldAnimateProductPlacementView = a3;
}

- (NSString)postPlayItemId
{
  return self->_postPlayItemId;
}

- (void)setPostPlayItemId:(id)a3
{
  objc_storeStrong((id *)&self->_postPlayItemId, a3);
}

- (UIViewController)moreInfoCanonicalViewController
{
  return self->_moreInfoCanonicalViewController;
}

- (void)setMoreInfoCanonicalViewController:(id)a3
{
  objc_storeStrong((id *)&self->_moreInfoCanonicalViewController, a3);
}

- (BOOL)transportBarVisible
{
  return self->_transportBarVisible;
}

- (void)setTransportBarVisible:(BOOL)a3
{
  self->_transportBarVisible = a3;
}

- (AVControlItem)extrasControlItem
{
  return self->_extrasControlItem;
}

- (void)setExtrasControlItem:(id)a3
{
  objc_storeStrong((id *)&self->_extrasControlItem, a3);
}

- (AVControlItem)multiViewControlItem
{
  return self->_multiViewControlItem;
}

- (void)setMultiViewControlItem:(id)a3
{
  objc_storeStrong((id *)&self->_multiViewControlItem, a3);
}

- (AVControlItem)shareControlItem
{
  return self->_shareControlItem;
}

- (void)setShareControlItem:(id)a3
{
  objc_storeStrong((id *)&self->_shareControlItem, a3);
}

- (VUIPerformanceDebuggerViewController)performanceDebuggerViewController
{
  return self->_performanceDebuggerViewController;
}

- (void)setPerformanceDebuggerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_performanceDebuggerViewController, a3);
}

- (NSTimer)clearPerformanceDebuggerTimer
{
  return self->_clearPerformanceDebuggerTimer;
}

- (void)setClearPerformanceDebuggerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clearPerformanceDebuggerTimer, a3);
}

- (BOOL)hasPerformanceDebuggerAppeared
{
  return self->_hasPerformanceDebuggerAppeared;
}

- (void)setHasPerformanceDebuggerAppeared:(BOOL)a3
{
  self->_hasPerformanceDebuggerAppeared = a3;
}

- (VUITimedMetadataDebuggerViewController)timedMetadataDebuggerViewController
{
  return self->_timedMetadataDebuggerViewController;
}

- (void)setTimedMetadataDebuggerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_timedMetadataDebuggerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedMetadataDebuggerViewController, 0);
  objc_storeStrong((id *)&self->_clearPerformanceDebuggerTimer, 0);
  objc_storeStrong((id *)&self->_performanceDebuggerViewController, 0);
  objc_storeStrong((id *)&self->_shareControlItem, 0);
  objc_storeStrong((id *)&self->_multiViewControlItem, 0);
  objc_storeStrong((id *)&self->_extrasControlItem, 0);
  objc_storeStrong((id *)&self->_moreInfoCanonicalViewController, 0);
  objc_storeStrong((id *)&self->_postPlayItemId, 0);
  objc_storeStrong((id *)&self->_productPlacementView, 0);
  objc_storeStrong((id *)&self->_productPlacementImage, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_hmwView, 0);
  objc_storeStrong((id *)&self->_highMotionWarningImage, 0);
  objc_storeStrong((id *)&self->_photoSensitivityImage, 0);
  objc_storeStrong((id *)&self->_ratingImage, 0);
  objc_storeStrong((id *)&self->_logoImageDownloader, 0);
  objc_storeStrong((id *)&self->_upNextButtonImpressionMetrics, 0);
  objc_storeStrong((id *)&self->_promoMetadataView, 0);
  objc_storeStrong((id *)&self->_skipTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_skipBottomConstraint, 0);
  objc_storeStrong((id *)&self->_skipCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_skipButtonImpressionMetrics, 0);
  objc_storeStrong((id *)&self->_postPlayImpressionTime, 0);
  objc_storeStrong((id *)&self->_initialPlaybackStartDate, 0);
  objc_storeStrong((id *)&self->_postPlayTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_postPlayView, 0);
  objc_storeStrong((id *)&self->_featureMonitor, 0);
  objc_storeStrong((id *)&self->_extrasPresenter, 0);
  objc_storeStrong((id *)&self->_PIPedBackgroundMediaController, 0);
  objc_storeStrong((id *)&self->_itemsConfiguration, 0);
  objc_storeStrong((id *)&self->_pausedTooLongTimer, 0);
  objc_storeStrong((id *)&self->_datePlaybackWasPaused, 0);
  objc_storeStrong((id *)&self->_dateAppWasBackgrounded, 0);
  objc_storeStrong((id *)&self->_multiPlayerDetailsViewController, 0);
  objc_storeStrong((id *)&self->_multiPlayerViewController, 0);
  objc_storeStrong((id *)&self->_playbackContainerViewController, 0);
  objc_storeStrong((id *)&self->_errorAlertController, 0);
  objc_storeStrong((id *)&self->_audioSessionSerialQueue, 0);
  objc_storeStrong(&self->_savedErrorContext, 0);
  objc_storeStrong((id *)&self->_savedErrorUserInfo, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_extrasAVPlayerViewController, 0);
  objc_storeStrong((id *)&self->_mainAVPlayerViewController, 0);
  objc_storeStrong((id *)&self->_avPlayerViewController, 0);
  objc_storeStrong((id *)&self->_extrasContext, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_extrasPlayer, 0);
  objc_storeStrong((id *)&self->_multiviewPlaybackInfo, 0);
  objc_storeStrong((id *)&self->_backgroundAudioPlayer, 0);
  objc_storeStrong((id *)&self->_mainPlayer, 0);
  objc_destroyWeak((id *)&self->_activePlayer);
}

- (void)extrasContext:(uint64_t)a1 hadFatalError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "Extras context had fatal error: %@", (uint8_t *)&v2, 0xCu);
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_704_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to start download because no view controller could be found for preflight presentation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_4_704_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to start download because media item is missing adam ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_6_711_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to start download because media entity or asset controller could not be found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Existing AVPlayerViewController reuse desired but cannot be reused since it is not presented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_3_881_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Unable to restore AVPlayerViewController since PIP is not being shown", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_883_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = OUTLINED_FUNCTION_6_18();
  objc_msgSend(v4, "avPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_23(&dword_1D96EE000, v6, v7, "Unable to restore AVPlayerViewController.  Presenting view controller is nil: %@, player view controller is nil: %@", v8, v9, v10, v11, 2u);

  OUTLINED_FUNCTION_2();
}

void __51__VUIPlaybackManager__registerStateMachineHandlers__block_invoke_887_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_7_24(a1, a2);
  v3 = OUTLINED_FUNCTION_6_18();
  objc_msgSend(v3, "avPlayerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_30();
  OUTLINED_FUNCTION_1_23(&dword_1D96EE000, v5, v6, "Unable to restore AVPlayerViewController.  Presenting view controller is nil: %@, player view controller is nil: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
