@implementation PIModernPhotosPipeline

- (id)_processedRenderNodeForComposition:(id)a3 input:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v16;
  const void **v17;
  const void **v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  const void **v24;
  void *v25;
  int v26;
  void *v27;
  NSObject *v28;
  const void **v29;
  void *v30;
  int v31;
  void *v32;
  const void **v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  const void **v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    NUAssertLogger_17296();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "composition != nil");
      v17 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17296();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v34 = dispatch_get_specific(*v18);
        v35 = (void *)MEMORY[0x1E0CB3978];
        v36 = v34;
        objc_msgSend(v35, "callStackSymbols");
        v18 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = (const void **)v34;
        v49 = 2114;
        v50 = v37;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v18;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    v26 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  v13 = v12;
  if (!v12)
  {
    NUAssertLogger_17296();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "pipelineState != nil");
      v24 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v24;
      _os_log_error_impl(&dword_1A6382000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    v25 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17296();
    v20 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v25)
    {
      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v18 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v18;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
LABEL_25:

      v31 = _NUAssertFailHandler();
      goto LABEL_26;
    }
LABEL_23:
    if (v26)
    {
      v38 = dispatch_get_specific(*v18);
      v39 = (void *)MEMORY[0x1E0CB3978];
      v40 = v38;
      objc_msgSend(v39, "callStackSymbols");
      v18 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR("\n"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = (const void **)v38;
      v49 = 2114;
      v50 = v41;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_25;
  }
  if (!a6)
  {
    NUAssertLogger_17296();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v29 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v29;
      _os_log_error_impl(&dword_1A6382000, v28, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    v30 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_17296();
    v20 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v30)
    {
      if (v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (const void **)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v33;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      goto LABEL_28;
    }
LABEL_26:
    if (v31)
    {
      v42 = dispatch_get_specific(*v18);
      v43 = (void *)MEMORY[0x1E0CB3978];
      v44 = v42;
      objc_msgSend(v43, "callStackSymbols");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "componentsJoinedByString:", CFSTR("\n"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = (const void **)v42;
      v49 = 2114;
      v50 = v46;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
LABEL_28:

    _NUAssertFailHandler();
  }
  -[PIModernPhotosPipeline evaluate:input:pipelineState:error:](self, "evaluate:input:pipelineState:error:", v10, v11, v12, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)evaluate:(id)a3 input:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
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
  int v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  int32_t v63;
  int64_t v64;
  void *v65;
  int64_t v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  unsigned int v71;
  void *v72;
  void *v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  int v84;
  id v85;
  PICinematicAudioRenderNode *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  PISemanticStyleRenderNode *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  PISemanticStyleRenderNode *v95;
  void *v96;
  NSObject *v97;
  PISemanticStyleRenderNode *v98;
  void *v99;
  void *v100;
  void *v101;
  char v102;
  void *v103;
  id *v104;
  void *v105;
  void *v106;
  PISemanticStyleRenderNode *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  int v114;
  void *v115;
  PISemanticStyleRenderNode *v116;
  PISemanticStyleLearnNode *v117;
  id v118;
  void *v119;
  PISemanticStyleApplyNode *v120;
  PISemanticStyleRenderNode *v121;
  void *v122;
  void *v123;
  void *v124;
  PISemanticStyleRenderNode *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  PISemanticStyleRenderNode *v131;
  void *v132;
  int v133;
  PISemanticStyleRenderNode *v134;
  id v135;
  id v136;
  void *v137;
  id *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  PISemanticStyleRenderNode *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  PISemanticStyleRenderNode *v149;
  void *v150;
  uint64_t v151;
  PISemanticStyleRenderNode *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  PISemanticStyleRenderNode *v157;
  int v158;
  PIPortraitEffectNode *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  double v172;
  double v173;
  void *v174;
  void *v175;
  id *v176;
  uint64_t v177;
  int v178;
  PISemanticStyleRenderNode *v179;
  PIPortraitEffectNode *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  void *v188;
  PISemanticStyleRenderNode *v189;
  void *v190;
  void *v191;
  int v192;
  void *v193;
  void *v194;
  id *v195;
  void *v196;
  id v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  uint64_t v202;
  void *v203;
  int v204;
  _BOOL8 v205;
  void *v206;
  void *v207;
  PISemanticStyleRenderNode *v208;
  int v209;
  void *v210;
  PISemanticStyleRenderNode *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  PIDepthEffectNode *v216;
  PISemanticStyleRenderNode *v217;
  PISemanticStyleRenderNode *v218;
  void *v219;
  double v220;
  double v221;
  void *v222;
  double v223;
  double v224;
  double v225;
  void *v226;
  id *v227;
  id v228;
  void *v229;
  void *v230;
  PISemanticStyleApplyNode *v231;
  void *v232;
  PISemanticStyleRenderNode *v233;
  void *v234;
  void *v235;
  int v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  const __CFString *v241;
  void *v242;
  int v243;
  void *v244;
  void *v245;
  int v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  int v251;
  void *v252;
  void *v253;
  void *v254;
  PISemanticStyleRenderNode *v255;
  void *v256;
  uint64_t v257;
  PISemanticStyleRenderNode *v258;
  PISemanticStyleRenderNode *v259;
  void *v260;
  int v261;
  PISemanticStyleRenderNode *v262;
  id *v263;
  void *v264;
  uint64_t v265;
  void *v266;
  int64_t v267;
  void *v268;
  uint64_t v269;
  int v270;
  PISemanticStyleRenderNode *v271;
  PISemanticStyleRenderNode *v272;
  void *v273;
  int64_t v274;
  void *v275;
  void *v276;
  int64_t v277;
  void *v278;
  void *v279;
  int64_t v280;
  void *v281;
  void *v282;
  int64_t v283;
  void *v284;
  void *v285;
  int64_t v286;
  void *v287;
  void *v288;
  unsigned int v289;
  unsigned int v290;
  PISemanticStyleRenderNode *v291;
  void *v292;
  PISemanticStyleRenderNode *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  const __CFString *v301;
  PISemanticStyleRenderNode *v302;
  void *v303;
  void *v304;
  void *v305;
  uint64_t v306;
  PISemanticStyleRenderNode *v307;
  void *v308;
  double v309;
  double v310;
  void *v311;
  double v312;
  double v313;
  void *v314;
  void *v315;
  void *v316;
  double v317;
  void *v318;
  void *v319;
  void *v320;
  double v321;
  double v322;
  void *v323;
  double v324;
  uint64_t v325;
  void *v326;
  void *v327;
  void *v328;
  uint64_t v329;
  void *v330;
  double v331;
  double v332;
  double v333;
  void *v334;
  double v335;
  double v336;
  void *v337;
  double v338;
  double v339;
  void *v340;
  double v341;
  double v342;
  void *v343;
  double v344;
  double v345;
  void *v346;
  double v347;
  double v348;
  void *v349;
  double v350;
  double v351;
  void *v352;
  double v353;
  double v354;
  void *v355;
  double v356;
  double v357;
  void *v358;
  double v359;
  double v360;
  void *v361;
  double v362;
  double v363;
  void *v364;
  void *v365;
  void *v366;
  double v367;
  double v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  double v377;
  double v378;
  double v379;
  void *v380;
  void *v381;
  void *v382;
  double v383;
  double v384;
  void *v385;
  double v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  double v392;
  double v393;
  void *v394;
  double v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  uint64_t v405;
  uint64_t i;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  double v411;
  void *v412;
  double v413;
  void *v414;
  void *v415;
  void *v416;
  double v417;
  void *v418;
  void *v419;
  void *v420;
  uint64_t v421;
  PISemanticStyleRenderNode *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  void *v444;
  void *v445;
  void *v446;
  void *v447;
  void *v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  void *v454;
  void *v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  void *v460;
  void *v461;
  void *v462;
  void *v463;
  void *v464;
  uint64_t v465;
  void *v466;
  void *v467;
  double v468;
  double v469;
  void *v470;
  void *v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  void *v476;
  uint64_t v477;
  void *v478;
  double v479;
  double v480;
  void *v481;
  double v482;
  double v483;
  void *v484;
  void *v485;
  void *v486;
  double v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  PISemanticStyleRenderNode *v492;
  void *v493;
  void *v494;
  double v495;
  void *v496;
  void *v497;
  PISemanticStyleRenderNode *v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  void *v505;
  void *v506;
  uint64_t v507;
  void *v508;
  void *v509;
  void *v510;
  void *v511;
  PIPhotoEffect3DNode *v512;
  void *v513;
  double v514;
  double v515;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  uint64_t v521;
  PISemanticStyleRenderNode *v522;
  PISemanticStyleRenderNode *v523;
  PISemanticStyleRenderNode *v524;
  void *v525;
  double v526;
  double v527;
  void *v528;
  double v529;
  double v530;
  void *v531;
  double v532;
  double v533;
  uint64_t v534;
  double v535;
  double v536;
  double v537;
  double v538;
  PISemanticStyleRenderNode *v539;
  void *v540;
  void *v541;
  void *v542;
  uint64_t v543;
  void *v544;
  void *v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t j;
  void *v550;
  int v551;
  void *v552;
  uint64_t v553;
  void *v554;
  uint64_t v555;
  void *v556;
  uint64_t v557;
  void *v558;
  uint64_t v559;
  PISemanticStyleRenderNode *v560;
  PISemanticStyleRenderNode *v561;
  void *v562;
  uint64_t v563;
  PICinematicAudioRenderNode *v564;
  __CFString *v565;
  __CFString *v566;
  uint64_t v567;
  uint64_t v568;
  void *v569;
  void *v570;
  id v571;
  uint64_t v572;
  void *v573;
  __CFString *v574;
  PICinematicAudioRenderNode *v575;
  double v576;
  double v577;
  uint64_t v578;
  double v579;
  double v580;
  uint64_t v581;
  double v582;
  void *v583;
  double v584;
  double v585;
  void *v586;
  double v587;
  long double v588;
  void *v589;
  double v590;
  double v591;
  double v592;
  double v593;
  uint64_t v594;
  double v595;
  double v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  double v600;
  void *v601;
  void *v602;
  void *v603;
  void *v604;
  void *v605;
  void *v606;
  void *v607;
  void *v608;
  PICinematicAudioRenderNode *v609;
  void *v610;
  void *v611;
  char v612;
  void *v613;
  void *v614;
  void *v615;
  void *v616;
  void *v617;
  double v618;
  double v619;
  void *v620;
  void *v621;
  uint64_t v622;
  void *v623;
  double v624;
  double v625;
  void *v626;
  float v627;
  double v628;
  uint64_t v629;
  void *v630;
  double v631;
  void *v632;
  int v633;
  void *v634;
  double v635;
  id v636;
  void *v637;
  uint64_t v638;
  PICinematicAudioRenderNode *v639;
  void *v640;
  void *v641;
  int v642;
  void *v643;
  void *v645;
  void *v646;
  void *v647;
  void *v648;
  uint64_t v649;
  PICinematicAudioRenderNode *v650;
  void *v651;
  void *v652;
  void *v653;
  void *v654;
  void *v655;
  PISemanticStyleRenderNode *v656;
  void *v657;
  uint64_t v658;
  void *v659;
  void *v660;
  void *v661;
  void *v662;
  void *v663;
  void *v664;
  void *v665;
  int v666;
  void *v667;
  void *v668;
  void *v669;
  void *v670;
  PIPortraitMakeBlurMapNode *v671;
  id *v672;
  int v673;
  id *v674;
  void *v675;
  PISemanticStyleRenderNode *v676;
  PISemanticStyleRenderNode *v677;
  void *v678;
  void *v679;
  PISemanticStyleRenderNode *v680;
  PISemanticStyleRenderNode *v681;
  void *v682;
  void *v683;
  unsigned int v684;
  PISemanticStyleLearnNode *v685;
  PISemanticStyleRenderNode *v686;
  id v687;
  int v688;
  void *v689;
  id v690;
  id v691;
  id v692;
  void *v693;
  id v694;
  void *v695;
  void *v696;
  void *v697;
  void *v698;
  void *v699;
  void *v700;
  void *v701;
  void *v702;
  void *v703;
  _BOOL4 v704;
  void *v705;
  void *v706;
  _BOOL4 v707;
  void *v708;
  void *v709;
  uint64_t v710;
  void *v711;
  void *v712;
  void *v713;
  void *v714;
  void *v715;
  void *v716;
  uint64_t v717;
  uint64_t v718;
  void *v719;
  void *v720;
  void *v721;
  void *v722;
  unsigned int value;
  uint64_t valueb;
  void *valuea;
  void *v726;
  void *v727;
  void *v728;
  void *v729;
  id v730;
  void *v731;
  void *v732;
  void *v733;
  void *v734;
  uint64_t v735;
  void *v736;
  void *v737;
  uint64_t v738;
  uint64_t v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  _OWORD v744[4];
  _BYTE v745[32];
  _BYTE v746[32];
  CMTime rhs;
  CMTime lhs;
  CMTime v749;
  CMTime v750;
  uint64_t v751;
  uint64_t v752;
  uint64_t v753;
  uint64_t v754;
  unsigned int v755;
  unsigned int v756;
  uint64_t v757;
  id v758;
  _QWORD v759[2];
  _BYTE v760[128];
  _QWORD v761[2];
  _QWORD v762[2];
  const __CFString *v763;
  void *v764;
  _QWORD v765[2];
  _QWORD v766[2];
  const __CFString *v767;
  PISemanticStyleRenderNode *v768;
  uint64_t v769;
  unsigned int v770;
  uint64_t v771;

  v771 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v730 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52270]), "initWithPipelineState:", v10);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("debug"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v710 = objc_msgSend(v10, "mediaComponentType");
  v733 = v10;
  v735 = objc_msgSend(v10, "mediaComponentType");
  v14 = v735 == 1;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("raw"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("inputDecoderVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("inputDecoderVersion"));

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("inputSushiLevel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("kCGImageSourceShouldExtendRaw"));
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("gainMapVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("gainMapVersion"));

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("gainMapParameters"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("gainMapParameters"));

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("boostVersion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("boostVersion"));

    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("boostParams"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("boostParams"));

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("raw_transferTone"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("debugTransferTone"));

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("raw_boost"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0C9E1A0]);

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("raw_exposure"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0C9E1E8]);

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("raw_blackPoint"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0C9E198]);

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("raw_toneMapping"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, CFSTR("inputToneMapping"));

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("raw_gamutMapping"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, CFSTR("inputGamutMapMax"));

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rawNoiseReduction"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "isEnabled"))
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("detail"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("inputNoiseReductionDetailAmount"));

    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("color"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v31, CFSTR("inputUIColorNoiseReductionAmount"));

    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("luminance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, CFSTR("inputUILuminanceNoiseReductionAmount"));

    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("sharpness"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v33, CFSTR("inputNoiseReductionSharpnessAmount"));

    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("contrast"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v34, CFSTR("inputNoiseReductionContrastAmount"));

  }
  v729 = v29;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("whiteBalance"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v16)
  {
    if (objc_msgSend(v35, "isEnabled"))
    {
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("colorType"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("tempTint"));

      if (v38)
      {
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("temperature"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v39, CFSTR("inputNeutralTemperature"));

        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("tint"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v40, CFSTR("inputNeutralTint"));

      }
    }
  }
  v731 = v36;
  v732 = v16;
  v734 = v12;
  v769 = *MEMORY[0x1E0CA2E18];
  value = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  v770 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v717 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("autoLoop"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v11, "mediaTypeForComposition:", v9);
  if ((objc_msgSend(v41, "isEnabled") & 1) != 0)
  {
    v43 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("livePhotoKeyFrame"));
    v43 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("videoPosterFrame"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v737 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("trim"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v42 & 0xFFFFFFFFFFFFFFFELL;
  if (v735 != 1 || v46 != 2)
  {
    if (v46 != 2)
      goto LABEL_49;
    objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("cropStraighten"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47 && (objc_msgSend(v41, "isEnabled") & 1) == 0)
    {
      if (v42 == 3)
        v48 = MEMORY[0x1E0C9AAA0];
      else
        v48 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v48, CFSTR("hardCropCleanAperture"));
    }
    if (!v43)
    {
      if (v44)
      {
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("time"));
        v726 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v41;
        v60 = objc_msgSend(v726, "longLongValue");
        objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("scale"));
        v682 = v13;
        v61 = v11;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "intValue");
        v64 = v60;
        v41 = v59;
        v43 = 0;
        CMTimeMake((CMTime *)v746, v64, v63);
        v769 = *(_QWORD *)v746;
        value = *(_DWORD *)&v746[12];
        v770 = *(_DWORD *)&v746[8];
        v717 = *(_QWORD *)&v746[16];

        v11 = v61;
        v13 = v682;

      }
      goto LABEL_49;
    }
    v697 = v45;
    v701 = v44;
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("time"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "longLongValue");
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("scale"));
    v51 = v41;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake((CMTime *)v746, v50, objc_msgSend(v52, "intValue"));
    v769 = *(_QWORD *)v746;
    value = *(_DWORD *)&v746[12];
    v770 = *(_DWORD *)&v746[8];
    v717 = *(_QWORD *)&v746[16];

    v41 = v51;
LABEL_44:
    v79 = 0;
    v704 = v43 != 0;
    v45 = v697;
    v44 = v701;
    goto LABEL_54;
  }
  if (!objc_msgSend(v11, "hasStaticTime"))
  {
    if (v42 != 2)
    {
      if (v42 != 3)
        goto LABEL_49;
      if (!v43)
      {
        if (objc_msgSend(v41, "isEnabled"))
        {
          v715 = v41;
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("flavor"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v68, "isEqualToString:", CFSTR("LongExposure")) & 1) == 0)
          {
            if (objc_msgSend(v45, "isEnabled"))
            {
              objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("start"));
              v727 = (void *)objc_claimAutoreleasedReturnValue();
              valueb = objc_msgSend(v727, "longLongValue");
              objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("startScale"));
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              CMTimeMake((CMTime *)v746, valueb, objc_msgSend(v69, "intValue"));
              v769 = *(_QWORD *)v746;
              LODWORD(valueb) = *(_DWORD *)&v746[12];
              v770 = *(_DWORD *)&v746[8];
              v718 = *(_QWORD *)&v746[16];

              v70 = v718;
              v71 = valueb;
            }
            else
            {
              CMTimeMake((CMTime *)v746, 0, 60);
              v769 = *(_QWORD *)v746;
              v71 = *(_DWORD *)&v746[12];
              v770 = *(_DWORD *)&v746[8];
              v70 = *(_QWORD *)&v746[16];
            }
            *(_QWORD *)v746 = v769;
            *(_QWORD *)&v746[8] = __PAIR64__(v71, v770);
            value = v71;
            v717 = v70;
            *(_QWORD *)&v746[16] = v70;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", v746);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v80, CFSTR("defaultFrameTime"));

            objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Video"), CFSTR("mediaComponentType"));
          }

          v41 = v715;
        }
        goto LABEL_49;
      }
      v697 = v45;
      v701 = v44;
      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("time"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "longLongValue");
      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("scale"));
      v55 = v41;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMake((CMTime *)v746, v54, objc_msgSend(v56, "intValue"));
      v769 = *(_QWORD *)v746;
      LODWORD(v54) = *(_DWORD *)&v746[12];
      v770 = *(_DWORD *)&v746[8];
      v57 = *(_QWORD *)&v746[16];

      v41 = v55;
      v58 = (void *)MEMORY[0x1E0CB3B18];
      *(_QWORD *)v746 = v769;
      *(_QWORD *)&v746[8] = __PAIR64__(v54, v770);
      value = v54;
      v717 = v57;
      *(_QWORD *)&v746[16] = v57;
      goto LABEL_43;
    }
    v697 = v45;
    v701 = v44;
    if (v44)
    {
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("time"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "longLongValue");
      v67 = CFSTR("scale");
    }
    else
    {
      v44 = v45;
      if (!objc_msgSend(v45, "isEnabled"))
      {
        CMTimeMake((CMTime *)v746, 0, 60);
        v769 = *(_QWORD *)v746;
        v77 = *(_DWORD *)&v746[12];
        v770 = *(_DWORD *)&v746[8];
        v76 = *(_QWORD *)&v746[16];
        goto LABEL_42;
      }
      objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("start"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "longLongValue");
      v67 = CFSTR("startScale");
    }
    objc_msgSend(v44, "objectForKeyedSubscript:", v67);
    v72 = v41;
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake((CMTime *)v746, v66, objc_msgSend(v73, "intValue"));
    v769 = *(_QWORD *)v746;
    v74 = *(_DWORD *)&v746[12];
    v770 = *(_DWORD *)&v746[8];
    v75 = *(_QWORD *)&v746[16];

    v41 = v72;
    v76 = v75;
    v77 = v74;
LABEL_42:
    v58 = (void *)MEMORY[0x1E0CB3B18];
    *(_QWORD *)v746 = v769;
    *(_QWORD *)&v746[8] = __PAIR64__(v77, v770);
    value = v77;
    v717 = v76;
    *(_QWORD *)&v746[16] = v76;
LABEL_43:
    objc_msgSend(v58, "valueWithCMTime:", v746);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v78, CFSTR("defaultFrameTime"));

    objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Video"), CFSTR("mediaComponentType"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hardCropCleanAperture"));
    goto LABEL_44;
  }
  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Video"), CFSTR("mediaComponentType"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hardCropCleanAperture"));
LABEL_49:
  v79 = 0;
  if (v42 != 3 || v43)
  {
    v704 = v43 != 0;
  }
  else if ((objc_msgSend(v41, "isEnabled") & 1) != 0)
  {
    v704 = 0;
    v79 = 0;
  }
  else if (v710 == 2)
  {
    v704 = 0;
    v79 = 1;
  }
  else
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("mediaComponentType"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v96, "isEqualToString:", CFSTR("Video"));

    v704 = 0;
  }
LABEL_54:
  if (objc_msgSend(v41, "isEnabled"))
  {
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("flavor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "isEqualToString:", CFSTR("LongExposure"));
    if (v735 == 1)
      v14 = v82;
    else
      v14 = 0;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("Video"), CFSTR("mediaComponentType"));

  }
  v707 = v14;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("skipOrientation"));
  objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("semanticStyle"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v83, "isEnabled");
  if (v84)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("revertToOriginalStyle"));
  v85 = (id)objc_msgSend(v11, "beginGroupWithName:error:", CFSTR("Master"), a6);
  if (!a6 || !*a6)
  {
    v716 = v41;
    objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("source"));
    v87 = objc_claimAutoreleasedReturnValue();
    v88 = v11;
    v89 = (void *)v87;
    v728 = v88;
    objc_msgSend(v88, "renderNodeFromSource:settings:error:", v87, v13, a6);
    v90 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

    if (a6 && *a6)
    {
      v86 = 0;
      v11 = v728;
LABEL_570:

      v41 = v716;
      goto LABEL_571;
    }
    if (v84)
    {
      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("revertToOriginalStyle"));
      objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("source"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v728, "renderNodeFromSource:settings:error:", v91, v13, a6);
      v695 = (void *)objc_claimAutoreleasedReturnValue();

      if (a6 && *a6)
      {
        v86 = 0;
        v11 = v728;
        v92 = v695;
LABEL_569:

        goto LABEL_570;
      }
      v688 = v79;
    }
    else
    {
      v688 = v79;
      v695 = 0;
    }
    v11 = v728;
    v758 = 0;
    objc_msgSend(v728, "inputForPath:error:", CFSTR("RAW/Linear"), &v758);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v694 = v758;
    if (v93)
    {
      objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("Source"), v93, a6);
      v696 = (void *)objc_claimAutoreleasedReturnValue();

      if (a6)
      {
        if (*a6)
        {
          v86 = 0;
          v94 = v694;
          v92 = v695;
LABEL_568:

          goto LABEL_569;
        }
        v693 = v83;
        v95 = v90;
LABEL_85:
        objc_msgSend(v728, "endGroupWithName:error:", CFSTR("Master"), a6);
        if (*a6)
        {
          v86 = 0;
          v90 = v95;
          goto LABEL_87;
        }
        -[NURenderNode imageProperties:](v95, "imageProperties:", a6);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        if (*a6)
        {
          v90 = v95;
          v86 = 0;
          v94 = v694;
          v92 = v695;
          v83 = v693;
LABEL_567:

          goto LABEL_568;
        }
        v687 = v119;
        v698 = v45;
        v702 = v44;
        v690 = v43;
LABEL_90:
        if (objc_msgSend(MEMORY[0x1E0D52108], "enableHDRSupport")
          && objc_msgSend(v733, "auxiliaryImageType") == 1
          && ((objc_msgSend(MEMORY[0x1E0D52108], "allAssetsCanUseHDRPipeline") & 1) != 0
           || objc_msgSend(v687, "isHDR")))
        {
          if (*MEMORY[0x1E0D52390] != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_841);
          v97 = (id)*MEMORY[0x1E0D52398];
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v746 = 0;
            _os_log_debug_impl(&dword_1A6382000, v97, OS_LOG_TYPE_DEBUG, "Evaluating pipeline as HDR input", v746, 2u);
          }

          v684 = 1;
        }
        else
        {
          v684 = 0;
        }
        v98 = v95;
        v99 = v98;
        v83 = v693;
        if (v696)
        {
          objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("raw_applyFirst"));
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v100, "BOOLValue") & 1) != 0)
          {
            v99 = v98;
LABEL_105:

            goto LABEL_106;
          }
          +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v101, "rawApplyBoostFirst");

          v11 = v728;
          v99 = v98;
          if ((v102 & 1) == 0)
          {
            objc_msgSend(v732, "objectForKeyedSubscript:", CFSTR("boostAmount"));
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v732, "objectForKeyedSubscript:", CFSTR("boostVersion"));
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v732, "objectForKeyedSubscript:", CFSTR("boostParams"));
            v104 = a6;
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            NUMakeDictionary4();
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PIForwardFakeBoost"), v684, v106);
            v99 = (void *)objc_claimAutoreleasedReturnValue();

            a6 = v104;
            v11 = v728;
            goto LABEL_105;
          }
        }
LABEL_106:
        objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("pre-SemanticStyle"), v99, a6);
        v90 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

        v686 = v98;
        if (a6 && *a6)
        {
          v86 = 0;
          v43 = v690;
          v45 = v698;
          v44 = v702;
          v94 = v694;
          v92 = v695;
LABEL_566:

          v119 = v687;
          goto LABEL_567;
        }
        if (!objc_msgSend(v693, "isEnabled"))
        {
          v685 = 0;
          v43 = v690;
          v45 = v698;
          v44 = v702;
          v116 = v90;
LABEL_121:
          objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("pre-AutoLoop"), v116, a6);
          v90 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

          if (a6 && *a6)
          {
            v86 = 0;
LABEL_157:
            v94 = v694;
            v92 = v695;
LABEL_565:

            goto LABEL_566;
          }
          v703 = v44;
          v693 = v83;
          if (!objc_msgSend(v716, "isEnabled"))
          {
LABEL_149:
            if ((value & 1) != 0 && v735 == 1)
            {
              v699 = v45;
              v135 = v43;
              v136 = objc_alloc(MEMORY[0x1E0D52208]);
              *(_QWORD *)v746 = v769;
              *(_QWORD *)&v746[8] = __PAIR64__(value, v770);
              *(_QWORD *)&v746[16] = v717;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", v746);
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              NUMakeDictionary2();
              v138 = a6;
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              NUMakeDictionary1();
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              v141 = objc_msgSend(v136, "initWithSettings:inputs:", v139, v140);

              a6 = v138;
              v11 = v728;
              v90 = (PISemanticStyleRenderNode *)v141;
              v43 = v135;
              v45 = v699;
              v44 = v703;
            }
            if (v84 && (objc_msgSend(v716, "isEnabled") & 1) == 0)
            {
              objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("ShowOriginalSource"), v695, a6);
              v92 = (void *)objc_claimAutoreleasedReturnValue();

              if (a6 && *a6)
              {
                v86 = 0;
                v94 = v694;
                goto LABEL_565;
              }
              v695 = v92;
            }
            else
            {
              objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("ShowOriginalSource"), v90, a6);
              v142 = objc_claimAutoreleasedReturnValue();

              if (a6 && *a6)
              {
                v86 = 0;
                v90 = (PISemanticStyleRenderNode *)v142;
                goto LABEL_157;
              }
              v90 = (PISemanticStyleRenderNode *)v142;
            }
            v107 = v90;
            objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("pre-Adjustments"), v107, a6);
            v116 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

            if (a6 && *a6)
            {
              v86 = 0;
              goto LABEL_166;
            }
            v681 = v107;
            v692 = v43;
            v700 = v45;
            if (v707)
            {
              objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("retouch"));
              v143 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();
              v144 = -[PISemanticStyleRenderNode isEnabled](v143, "isEnabled");
              v680 = v143;
              if ((_DWORD)v144)
              {
                v676 = v116;
                v767 = CFSTR("retouch");
                v768 = v143;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v768, &v767, 1);
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "cacheNode:type:settings:error:", v116, CFSTR("Retouch"), v145, a6);
                v675 = (void *)objc_claimAutoreleasedReturnValue();

                if (a6 && *a6)
                {
                  v86 = 0;
                  v11 = v728;
                  v45 = v700;
                  v94 = v694;
                  v92 = v695;
LABEL_561:

                  v90 = v676;
                  goto LABEL_562;
                }
                v765[0] = CFSTR("image");
                v765[1] = CFSTR("retouchedImage");
                v766[0] = v116;
                v766[1] = v675;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v766, v765, 2);
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v728, "switchFromNodes:mainInput:selector:", v146, CFSTR("image"), &__block_literal_global_16733);
                v147 = objc_claimAutoreleasedReturnValue();

                v116 = (PISemanticStyleRenderNode *)v147;
              }
              objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("apertureRedEye"));
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v148, "isEnabled"))
              {
                objc_msgSend(v728, "performApertureRedeyeOnImage:useHDRFilter:redEyeAdjustment:", v116, v684, v148);
                v149 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                v144 = 1;
              }
              else
              {
                v149 = v116;
              }
              objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("redEye"));
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v150, "isEnabled"))
              {
                objc_msgSend(v728, "performRedeyeOnImage:useHDRFilter:redEyeAdjustment:", v149, v684, v150);
                v151 = objc_claimAutoreleasedReturnValue();

                v144 = 1;
                v149 = (PISemanticStyleRenderNode *)v151;
              }

              v11 = v728;
              v116 = v149;
            }
            else
            {
              v144 = 0;
            }
            v152 = v116;
            objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("depthEffect"));
            v153 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("effect3D"));
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("portraitEffect"));
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v675 = (void *)v153;
            v156 = (void *)v153;
            v157 = v152;
            v673 = objc_msgSend(v156, "isEnabled");
            v669 = v154;
            v666 = objc_msgSend(v154, "isEnabled");
            v670 = v155;
            v158 = objc_msgSend(v155, "isEnabled");
            v680 = v152;
            if (v735 == 1)
            {
              v159 = (PIPortraitEffectNode *)v152;
              v160 = v687;
              if ((v158 & 1) == 0)
              {
                v763 = CFSTR("keepCacheWhenAtOneToOne");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v144);
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                v764 = v161;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v764, &v763, 1);
                v162 = objc_claimAutoreleasedReturnValue();
                v163 = v11;
                v164 = (void *)v162;
                objc_msgSend(v163, "cacheNode:type:settings:error:", v152, CFSTR("Intermediate"), v162, a6);
                v159 = (PIPortraitEffectNode *)objc_claimAutoreleasedReturnValue();

                if (a6 && *a6)
                {
                  v676 = (PISemanticStyleRenderNode *)v159;
                  v86 = 0;
                  v11 = v728;
                  v43 = v692;
                  v45 = v700;
                  v44 = v703;
                  v94 = v694;
                  v92 = v695;
LABEL_560:

                  goto LABEL_561;
                }
                v160 = v687;
              }
              objc_msgSend(v160, "auxiliaryImagePropertiesForType:", 2);
              v165 = (void *)objc_claimAutoreleasedReturnValue();

              if (v165)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v675, "objectForKeyedSubscript:", CFSTR("depthInfo"));
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v167, CFSTR("depthInfo"));

                objc_msgSend(v675, "objectForKeyedSubscript:", CFSTR("aperture"));
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v168, CFSTR("aperture"));

                objc_msgSend(v675, "objectForKeyedSubscript:", CFSTR("focusRect"));
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v169, CFSTR("focusRect"));

                objc_msgSend(v675, "objectForKeyedSubscript:", CFSTR("glassesMatteAllowed"));
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v170, CFSTR("glassesMatteAllowed"));

                v671 = -[PIPortraitMakeBlurMapNode initWithInput:settings:]([PIPortraitMakeBlurMapNode alloc], "initWithInput:settings:", v159, v166);
              }
              else
              {
                v671 = 0;
              }
            }
            else
            {
              v671 = 0;
              v159 = (PIPortraitEffectNode *)v152;
            }
            objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("inputExposure"));
            v171 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v171, "doubleValue");
            v173 = v172;

            if (v173 != 0.0)
            {
              objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("inputExposure"));
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              NUMakeDictionary2();
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CIExposureAdjust"), v684, v175);
              v176 = a6;
              v177 = objc_claimAutoreleasedReturnValue();

              v159 = (PIPortraitEffectNode *)v177;
              a6 = v176;
            }
            if (v735 == 1)
              v178 = v158;
            else
              v178 = 0;
            v179 = v157;
            if (v178 == 1)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v180 = v159;
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v670, "objectForKeyedSubscript:", CFSTR("kind"));
              v182 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v181, "setObject:forKeyedSubscript:", v182, CFSTR("kind"));

              objc_msgSend(v670, "objectForKeyedSubscript:", CFSTR("portraitInfo"));
              v183 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v181, "setObject:forKeyedSubscript:", v183, CFSTR("portraitInfo"));

              objc_msgSend(v670, "objectForKeyedSubscript:", CFSTR("strength"));
              v184 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v181, "setObject:forKeyedSubscript:", v184, CFSTR("strength"));

              objc_msgSend(v670, "objectForKeyedSubscript:", CFSTR("spillMatteAllowed"));
              v185 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v181, "setObject:forKeyedSubscript:", v185, CFSTR("spillMatteAllowed"));

              v186 = v181;
              v159 = -[PIPortraitEffectNode initWithInput:blurMap:settings:]([PIPortraitEffectNode alloc], "initWithInput:blurMap:settings:", v180, v671, v181);

              v11 = v728;
              if (objc_msgSend(v728, "versionForPortraitEffect:", v670) >= 2)
              {
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("PortraitV2"), v159, a6);
                v187 = objc_claimAutoreleasedReturnValue();

                if (a6)
                {
                  v676 = (PISemanticStyleRenderNode *)v187;
                  if (*a6)
                  {
                    v668 = v186;
LABEL_234:
                    v86 = 0;
                    v43 = v692;
LABEL_235:
                    v45 = v700;
                    v44 = v703;
                    v94 = v694;
                    v92 = v695;
LABEL_559:

                    goto LABEL_560;
                  }
                  v159 = (PIPortraitEffectNode *)v187;
                }
                else
                {
                  v159 = (PIPortraitEffectNode *)v187;
                }
              }

            }
            else
            {
              v11 = v728;
            }
            objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("portraitVideo"));
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("pre-PortraitVideo"), v159, a6);
            v189 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

            v668 = v188;
            if (a6 && *a6)
            {
              v676 = v189;
              goto LABEL_234;
            }
            if (!objc_msgSend(v188, "isEnabled"))
              goto LABEL_231;
            v676 = v189;
            objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("source"));
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            v191 = v11;
            v192 = objc_msgSend(v11, "isSourceAvailable:sourceSettings:", v190, &unk_1E50592C8);

            if (!v192)
            {
              v11 = v191;
              goto LABEL_231;
            }
            objc_msgSend(v191, "auxiliaryImageFromComposition:type:mediaComponentType:error:", v737, CFSTR("Disparity"), CFSTR("Video"), a6);
            v665 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v191;
            if (a6 && *a6)
            {
              v86 = 0;
LABEL_228:
              v43 = v692;
              v45 = v700;
              v44 = v703;
              v94 = v694;
              v92 = v695;
LABEL_558:

              goto LABEL_559;
            }
            objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("disparityKeyframes"));
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("apertureKeyframes"));
            v194 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("debugMode"));
            v195 = a6;
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v191, "portraitVideo:disparityInput:disparityKeyframes:apertureKeyframes:debugMode:error:", v189, v665, v193, v194, objc_msgSend(v196, "integerValue"), v195);
            v189 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

            a6 = v195;
            if (v195 && *v195)
            {
              v86 = 0;
              v676 = v189;
LABEL_227:
              v11 = v728;
              goto LABEL_228;
            }
            if (v735 != 1)
            {
LABEL_223:
              objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("debugMode"));
              v203 = (void *)objc_claimAutoreleasedReturnValue();
              v204 = objc_msgSend(v203, "intValue");

              if ((v204 & 0xFFFFFFFE) == 6)
              {
                v205 = v204 == 7;
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("source"));
                v206 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("cinematographyState"));
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v728, "portraitVideoDebugDetectedObjects:source:cinematographyState:monochrome:error:", v189, v206, v207, v205, v195);
                v676 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                a6 = v195;
                if (v195 && *v195)
                {
                  v86 = 0;
                  goto LABEL_227;
                }
                v189 = v676;
              }

              v11 = v728;
              v179 = v680;
LABEL_231:
              objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("post-PortraitVideo"), v189, a6);
              v208 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

              if (a6 && *a6)
              {
                v676 = v208;
                goto LABEL_234;
              }
              if (v735 == 1)
                v209 = v673;
              else
                v209 = 0;
              v210 = v731;
              v43 = v692;
              if (v209 == 1 && v671)
              {
                v211 = v208;
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v212 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v675, "objectForKeyedSubscript:", CFSTR("depthInfo"));
                v213 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v212, "setObject:forKeyedSubscript:", v213, CFSTR("depthInfo"));

                objc_msgSend(v675, "objectForKeyedSubscript:", CFSTR("aperture"));
                v214 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v212, "setObject:forKeyedSubscript:", v214, CFSTR("aperture"));

                if ((v158 & 1) != 0)
                {
                  objc_msgSend(v670, "objectForKeyedSubscript:", CFSTR("kind"));
                  v215 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v212, "setObject:forKeyedSubscript:", v215, CFSTR("portraitEffect"));

                }
                else
                {
                  objc_msgSend(v212, "setObject:forKeyedSubscript:", 0, CFSTR("portraitEffect"));
                }
                v11 = v728;
                v210 = v731;
                v43 = v692;
                v216 = -[PIDepthEffectNode initWithInput:blurMap:settings:]([PIDepthEffectNode alloc], "initWithInput:blurMap:settings:", v211, v671, v212);

                v208 = (PISemanticStyleRenderNode *)v216;
              }
              objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("masterSpace"), v208, a6);
              v217 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

              if (a6 && *a6)
              {
                v676 = v217;
                v86 = 0;
                goto LABEL_235;
              }
              v218 = v217;
              objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("noiseReduction"));
              v736 = (void *)objc_claimAutoreleasedReturnValue();
              v665 = v218;
              if (objc_msgSend(v736, "isEnabled"))
              {
                objc_msgSend(v736, "objectForKeyedSubscript:", CFSTR("radius"));
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v219, "doubleValue");
                v221 = v220;

                objc_msgSend(v736, "objectForKeyedSubscript:", CFSTR("edgeDetail"));
                v222 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v222, "doubleValue");
                v224 = v223;

                v225 = v221 * 0.5;
                if (v710 != 2)
                  v225 = v221;
                objc_msgSend(MEMORY[0x1E0D52268], "scaleMultiplyOfScalar:", v225);
                v226 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0D52268], "scaleMultiplyOfScalar:", v224);
                v227 = a6;
                v228 = v43;
                v229 = (void *)objc_claimAutoreleasedReturnValue();
                NUMakeDictionary3();
                v230 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PIBilateralFilter"), v684, v230);
                v218 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                v11 = v728;
                v43 = v228;
                a6 = v227;
                v179 = v680;
                v210 = v731;

              }
              if (v685)
              {
                v231 = -[PISemanticStyleApplyNode initWithInput:style:thumbnail:]([PISemanticStyleApplyNode alloc], "initWithInput:style:thumbnail:", v218, v685, v179);

                v218 = (PISemanticStyleRenderNode *)v231;
              }
              v232 = v737;
              objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("pre-WB"), v218, a6);
              v233 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

              if (a6 && *a6)
              {
                v676 = v233;
LABEL_285:
                v86 = 0;
                v45 = v700;
                v44 = v703;
                v94 = v694;
                v92 = v695;
LABEL_557:

                goto LABEL_558;
              }
              if (!objc_msgSend(v210, "isEnabled"))
                goto LABEL_282;
              v677 = v233;
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v234 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v210, "objectForKeyedSubscript:", CFSTR("colorType"));
              v235 = (void *)objc_claimAutoreleasedReturnValue();
              v236 = objc_msgSend(v235, "isEqualToString:", CFSTR("warmTint"));

              if (v236)
              {
                objc_msgSend(v234, "setObject:forKeyedSubscript:", v677, CFSTR("inputImage"));
                objc_msgSend(v210, "objectForKeyedSubscript:", CFSTR("warmTemp"));
                v237 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v234, "setObject:forKeyedSubscript:", v237, CFSTR("inputWarmTemp"));

                objc_msgSend(v210, "objectForKeyedSubscript:", CFSTR("warmTint"));
                v238 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v234, "setObject:forKeyedSubscript:", v238, CFSTR("inputWarmTint"));

                objc_msgSend(v210, "objectForKeyedSubscript:", CFSTR("warmFace"));
                v239 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v234, "setObject:forKeyedSubscript:", v239, CFSTR("inputHasFace"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v696 != 0);
                v240 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v234, "setObject:forKeyedSubscript:", v240, CFSTR("inputIsRaw"));
                v241 = CFSTR("PIColorBalanceFilter");
              }
              else
              {
                objc_msgSend(v210, "objectForKeyedSubscript:", CFSTR("colorType"));
                v242 = (void *)objc_claimAutoreleasedReturnValue();
                v243 = objc_msgSend(v242, "isEqualToString:", CFSTR("tempTint"));

                if (!v243 || v696)
                {
                  objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("colorType"));
                  v245 = (void *)objc_claimAutoreleasedReturnValue();
                  v246 = objc_msgSend(v245, "isEqualToString:", CFSTR("faceBalance"));

                  if (v246)
                  {
                    objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("faceI"));
                    v240 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("faceQ"));
                    v247 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v240 || objc_msgSend(v240, "isEqualToNumber:", &unk_1E5051550))
                    {

                      v240 = &unk_1E505CEA0;
                    }
                    if (!v247 || objc_msgSend(v247, "isEqualToNumber:", &unk_1E5051550))
                    {

                      v247 = &unk_1E505CEB0;
                    }
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", v677, CFSTR("inputImage"));
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", v240, CFSTR("inputOrigI"));
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", v247, CFSTR("inputOrigQ"));
                    objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("faceStrength"));
                    v248 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", v248, CFSTR("inputStrength"));

                    objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("faceWarmth"));
                    v249 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", v249, CFSTR("inputWarmth"));

                    if (v696)
                      v241 = CFSTR("PIRAWFaceBalance");
                    else
                      v241 = CFSTR("CIFaceBalance");

                  }
                  else
                  {
                    objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("colorType"));
                    v250 = (void *)objc_claimAutoreleasedReturnValue();
                    v251 = objc_msgSend(v250, "isEqualToString:", CFSTR("neutralGray"));

                    if (!v251)
                    {
                      v11 = v728;
                      v232 = v737;
                      v43 = v692;
                      goto LABEL_280;
                    }
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", v677, CFSTR("inputImage"));
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", &unk_1E5051FF8, CFSTR("strength"));
                    objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("grayWarmth"));
                    v252 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", v252, CFSTR("warmth"));

                    objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("grayY"));
                    v253 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", v253, CFSTR("y"));

                    objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("grayI"));
                    v254 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", v254, CFSTR("i"));

                    objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("grayQ"));
                    v240 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v234, "setObject:forKeyedSubscript:", v240, CFSTR("q"));
                    v241 = CFSTR("PINeutralGrayWhiteBalanceFilter");
                  }
                  v232 = v737;
                }
                else
                {
                  objc_msgSend(v234, "setObject:forKeyedSubscript:", v677, CFSTR("inputImage"));
                  objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("temperature"));
                  v244 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v234, "setObject:forKeyedSubscript:", v244, CFSTR("temperature"));

                  objc_msgSend(v731, "objectForKeyedSubscript:", CFSTR("tint"));
                  v240 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v234, "setObject:forKeyedSubscript:", v240, CFSTR("tint"));
                  v241 = CFSTR("PITempTintFilter");
                }
              }

              v43 = v692;
              if (v234)
              {
                v11 = v728;
                objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", v241, v684, v234);
                v233 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

LABEL_281:
LABEL_282:
                objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("pre-Mute"), v233, a6);
                v255 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (a6 && *a6)
                {
                  v676 = v255;
                  goto LABEL_285;
                }
                objc_msgSend(v232, "objectForKeyedSubscript:", CFSTR("mute"));
                v256 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v256, "isEnabled"))
                {
                  v257 = objc_msgSend(objc_alloc(MEMORY[0x1E0D521F0]), "initWithInput:", v255);

                  v255 = (PISemanticStyleRenderNode *)v257;
                }
                v258 = v255;
                objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("Mute"), v255, a6);
                v259 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (a6 && *a6)
                {
                  v676 = v259;
                  v86 = 0;
LABEL_296:
                  v44 = v703;
                  v94 = v694;
                  v92 = v695;
LABEL_556:

                  v45 = v700;
                  goto LABEL_557;
                }
                if (objc_msgSend(v716, "isEnabled")
                  && (objc_msgSend(v716, "objectForKeyedSubscript:", CFSTR("flavor")),
                      v260 = (void *)objc_claimAutoreleasedReturnValue(),
                      v261 = objc_msgSend(v260, "isEqualToString:", CFSTR("LongExposure")),
                      v260,
                      !v261))
                {
                  v676 = v259;
                  valuea = v256;
                  v263 = a6;
                  v683 = v13;
                  v270 = 1;
                }
                else
                {
                  objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("pre-LivePhotoKeyFrame"), v259, a6);
                  v262 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                  if (a6 && *a6)
                  {
                    v86 = 0;
                    v676 = v262;
                    goto LABEL_296;
                  }
                  v263 = a6;
                  v683 = v13;
                  valuea = v256;
                  if (v704)
                  {
                    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("time"));
                    v264 = (void *)objc_claimAutoreleasedReturnValue();
                    v265 = objc_msgSend(v264, "longLongValue");
                    v266 = v43;
                    v267 = v265;
                    objc_msgSend(v266, "objectForKeyedSubscript:", CFSTR("scale"));
                    v268 = (void *)objc_claimAutoreleasedReturnValue();
                    CMTimeMake((CMTime *)v746, v267, objc_msgSend(v268, "intValue"));
                    v769 = *(_QWORD *)v746;
                    LODWORD(v267) = *(_DWORD *)&v746[12];
                    v770 = *(_DWORD *)&v746[8];
                    v269 = *(_QWORD *)&v746[16];

                    *(_QWORD *)v746 = v769;
                    *(_QWORD *)&v746[8] = __PAIR64__(v267, v770);
                    *(_QWORD *)&v746[16] = v269;
                    objc_msgSend(v728, "livePhotoKeyFrameMetadataFromNode:time:error:", v262, v746, v263);
                    v676 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                    if (v263 && *v263)
                    {
                      v86 = 0;
LABEL_554:
                      v11 = v728;
                      goto LABEL_555;
                    }
                    v262 = v676;
                  }
                  v11 = v728;
                  objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("LivePhotoKeyFrame"), v262, v263);
                  v676 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                  if (v263 && *v263)
                  {
LABEL_314:
                    v86 = 0;
LABEL_555:
                    v13 = v683;
                    v43 = v692;
                    v44 = v703;
                    v94 = v694;
                    v92 = v695;
                    v256 = valuea;
                    goto LABEL_556;
                  }
                  v270 = 0;
                }
                v271 = v676;
                objc_msgSend(v11, "addTagWithName:inputNode:error:", CFSTR("pre-Trim"), v676, v263);
                v676 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v263 && *v263)
                  goto LABEL_314;
                v674 = v263;
                if (((v270 | objc_msgSend(v700, "isEnabled") ^ 1) & 1) != 0)
                {
                  v272 = v676;
                }
                else
                {
                  memset(v746, 0, 24);
                  objc_msgSend(v700, "objectForKeyedSubscript:", CFSTR("start"));
                  v273 = (void *)objc_claimAutoreleasedReturnValue();
                  v274 = objc_msgSend(v273, "longLongValue");
                  objc_msgSend(v700, "objectForKeyedSubscript:", CFSTR("startScale"));
                  v275 = (void *)objc_claimAutoreleasedReturnValue();
                  CMTimeMake((CMTime *)v746, v274, objc_msgSend(v275, "intValue"));

                  memset(v745, 0, 24);
                  objc_msgSend(v700, "objectForKeyedSubscript:", CFSTR("end"));
                  v276 = (void *)objc_claimAutoreleasedReturnValue();
                  v277 = objc_msgSend(v276, "longLongValue");
                  objc_msgSend(v700, "objectForKeyedSubscript:", CFSTR("endScale"));
                  v278 = (void *)objc_claimAutoreleasedReturnValue();
                  CMTimeMake((CMTime *)v745, v277, objc_msgSend(v278, "intValue"));

                  v750 = *(CMTime *)v746;
                  v749 = *(CMTime *)v745;
                  objc_msgSend(v11, "trimInput:startTime:endTime:error:", v676, &v750, &v749, v263);
                  v272 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                  if (v263 && *v263)
                    goto LABEL_317;
                }
                v11 = v728;
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("Trim"), v272, v263);
                v676 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v263 && *v263)
                  goto LABEL_314;
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("pre-SloMo"), v676, v263);
                v272 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v263 && *v263)
                {
LABEL_317:
                  v86 = 0;
                  v676 = v272;
                  goto LABEL_554;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("slomo"));
                v664 = (void *)objc_claimAutoreleasedReturnValue();
                if (v664)
                {
                  memset(v746, 0, 24);
                  objc_msgSend(v664, "objectForKeyedSubscript:", CFSTR("start"));
                  v279 = (void *)objc_claimAutoreleasedReturnValue();
                  v280 = objc_msgSend(v279, "longLongValue");
                  objc_msgSend(v664, "objectForKeyedSubscript:", CFSTR("startScale"));
                  v281 = (void *)objc_claimAutoreleasedReturnValue();
                  CMTimeMake((CMTime *)v746, v280, objc_msgSend(v281, "intValue"));

                  memset(v745, 0, 24);
                  objc_msgSend(v664, "objectForKeyedSubscript:", CFSTR("end"));
                  v282 = (void *)objc_claimAutoreleasedReturnValue();
                  v283 = objc_msgSend(v282, "longLongValue");
                  objc_msgSend(v664, "objectForKeyedSubscript:", CFSTR("endScale"));
                  v284 = (void *)objc_claimAutoreleasedReturnValue();
                  CMTimeMake((CMTime *)v745, v283, objc_msgSend(v284, "intValue"));

                  if (((v270 | objc_msgSend(v700, "isEnabled") ^ 1) & 1) == 0)
                  {
                    memset(&v750, 0, sizeof(v750));
                    objc_msgSend(v700, "objectForKeyedSubscript:", CFSTR("start"));
                    v285 = (void *)objc_claimAutoreleasedReturnValue();
                    v286 = objc_msgSend(v285, "longLongValue");
                    objc_msgSend(v700, "objectForKeyedSubscript:", CFSTR("startScale"));
                    v287 = (void *)objc_claimAutoreleasedReturnValue();
                    CMTimeMake(&v750, v286, objc_msgSend(v287, "intValue"));

                    lhs = *(CMTime *)v746;
                    rhs = v750;
                    CMTimeSubtract(&v749, &lhs, &rhs);
                    *(CMTime *)v746 = v749;
                    lhs = *(CMTime *)v745;
                    rhs = v750;
                    CMTimeSubtract(&v749, &lhs, &rhs);
                    *(CMTime *)v745 = v749;
                  }
                  objc_msgSend(v664, "objectForKeyedSubscript:", CFSTR("rate"));
                  v288 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v288, "floatValue");
                  v290 = v289;

                  v750 = *(CMTime *)v746;
                  v749 = *(CMTime *)v745;
                  objc_msgSend(v728, "createSloMoWithInput:startTime:endTime:rate:error:", v272, &v750, &v749, v263, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&v745[4], v290)));
                  v676 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                  if (v263 && *v263)
                    goto LABEL_341;
                }
                else
                {
                  v676 = v272;
                }
                v291 = v676;
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("SloMo"), v676, v263);
                v676 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v263 && *v263)
                  goto LABEL_341;
                if (v707)
                {
                  objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("semanticEnhance"));
                  v292 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v292, "isEnabled"))
                  {
                    v293 = v676;
                    objc_msgSend(v292, "objectForKeyedSubscript:", CFSTR("sceneLabel"));
                    v294 = (void *)objc_claimAutoreleasedReturnValue();
                    v295 = (void *)MEMORY[0x1E0C99E08];
                    v676 = v293;
                    v762[0] = v293;
                    v761[0] = CFSTR("inputImage");
                    v761[1] = CFSTR("inputConfidence");
                    objc_msgSend(v292, "objectForKeyedSubscript:", CFSTR("sceneConfidence"));
                    v296 = (void *)objc_claimAutoreleasedReturnValue();
                    v762[1] = v296;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v762, v761, 2);
                    v297 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v295, "dictionaryWithDictionary:", v297);
                    v298 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v292, "objectForKeyedSubscript:", CFSTR("faceBoundingBoxes"));
                    v299 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v298, "setObject:forKeyedSubscript:", v299, CFSTR("inputFaceBoxArray"));

                    if (objc_msgSend(v294, "isEqualToString:", CFSTR("platedFood")))
                    {
                      objc_msgSend(v292, "objectForKeyedSubscript:", CFSTR("boundingBoxes"));
                      v300 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v298, "setObject:forKeyedSubscript:", v300, CFSTR("inputBoundingBoxArray"));

                      v301 = CFSTR("CIDynamicFood");
                    }
                    else
                    {
                      if ((objc_msgSend(v294, "isEqualToString:", CFSTR("sunsetOrSunrise")) & 1) == 0
                        && (objc_msgSend(v294, "isEqualToString:", CFSTR("genericLandscape")) & 1) == 0)
                      {
                        if (v263)
                        {
                          objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Unknown sceneLabel when rendering semantic enhance adjustment"), v292);
                          *v263 = (id)objc_claimAutoreleasedReturnValue();
                        }

                        goto LABEL_341;
                      }
                      v301 = CFSTR("CIDynamicRender");
                    }
                    objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", v301, v684, v298);
                    v302 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v292, "objectForKeyedSubscript:", CFSTR("intensity"));
                    v303 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v303)
                    {
                      objc_msgSend(v292, "objectForKeyedSubscript:", CFSTR("intensity"));
                      v304 = (void *)objc_claimAutoreleasedReturnValue();
                      NUMakeDictionary4();
                      v305 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CIDissolveTransition"), v684, v305);
                      v306 = objc_claimAutoreleasedReturnValue();

                      v302 = (PISemanticStyleRenderNode *)v306;
                    }

                    v676 = v302;
                  }

                }
                v307 = v676;
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("pre-SmartTone"), v676, v263);
                v676 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v263)
                {
                  if (*v263)
                  {
LABEL_341:
                    v86 = 0;
LABEL_553:

                    goto LABEL_554;
                  }
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("smartTone"));
                v655 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v655, "isEnabled"))
                {
                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("inputShadows"));
                  v308 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v308, "doubleValue");
                  v310 = v309;
                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("offsetShadows"));
                  v311 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v311, "doubleValue");
                  v313 = v310 + v312;

                  if (v707)
                  {
                    objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("statistics"));
                    v314 = (void *)objc_claimAutoreleasedReturnValue();
                    v315 = v314;
                    if (v314)
                    {
                      objc_msgSend(v314, "objectForKeyedSubscript:", CFSTR("lightMap"));
                      v316 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v316)
                      {
                        objc_msgSend(v315, "objectForKeyedSubscript:", CFSTR("lightMap"));
                        v719 = (void *)objc_claimAutoreleasedReturnValue();
                        v317 = fmax(v313, 0.0);
                        if (objc_msgSend(v728, "isCIFilterAvailable:propertyName:", CFSTR("CILocalLightMapPrepare"), 0))
                        {
                          NUMakeDictionary3();
                          v318 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CILocalLightMapPrepare"), v684, v318);
                          v319 = (void *)objc_claimAutoreleasedReturnValue();

                          v320 = (void *)MEMORY[0x1E0CB37E8];
                          objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("inputLocalLight"));
                          v711 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v711, "doubleValue");
                          v322 = v321;
                          objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("offsetLocalLight"));
                          v323 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v323, "doubleValue");
                          objc_msgSend(v320, "numberWithDouble:", v322 + v324);
                          v325 = objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v317);
                          v326 = (void *)objc_claimAutoreleasedReturnValue();
                          v327 = (void *)v325;
                          NUMakeDictionary5();
                          v328 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CILocalLightFilter"), v684, v328, CFSTR("__dominantInputSettingsKey"), CFSTR("inputImage"));
                          v329 = objc_claimAutoreleasedReturnValue();

                        }
                        else
                        {
                          v330 = (void *)MEMORY[0x1E0CB37E8];
                          objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("inputLocalLight"));
                          v319 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v319, "doubleValue");
                          v332 = v331;
                          objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("offsetLocalLight"));
                          v711 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v711, "doubleValue");
                          objc_msgSend(v330, "numberWithDouble:", v332 + v333);
                          v323 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v317);
                          v327 = (void *)objc_claimAutoreleasedReturnValue();
                          NUMakeDictionary6();
                          v326 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CILocalLightFilter"), v684, v326, CFSTR("inputGuideImage"), v681, CFSTR("__dominantInputSettingsKey"), CFSTR("inputImage"));
                          v329 = objc_claimAutoreleasedReturnValue();

                        }
                        v676 = (PISemanticStyleRenderNode *)v329;
                      }
                    }

                  }
                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("inputExposure"));
                  v334 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v334, "doubleValue");
                  v336 = v335;
                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("offsetExposure"));
                  v337 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v337, "doubleValue");
                  v339 = v336 + v338;

                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("inputContrast"));
                  v340 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v340, "doubleValue");
                  v342 = v341;
                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("offsetContrast"));
                  v343 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v343, "doubleValue");
                  v345 = v342 + v344;

                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("inputBrightness"));
                  v346 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v346, "doubleValue");
                  v348 = v347;
                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("offsetBrightness"));
                  v349 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v349, "doubleValue");
                  v351 = v348 + v350;

                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("inputHighlights"));
                  v352 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v352, "doubleValue");
                  v354 = v353;
                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("offsetHighlights"));
                  v355 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v355, "doubleValue");
                  v357 = v354 + v356;

                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("inputBlack"));
                  v358 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v358, "doubleValue");
                  v360 = v359;
                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("offsetBlack"));
                  v361 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v361, "doubleValue");
                  v363 = v360 + v362;

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v351);
                  v364 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary2();
                  v365 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CIHighKey"), v684, v365);
                  v366 = (void *)objc_claimAutoreleasedReturnValue();

                  v367 = fmin(v313, 0.0);
                  if (v707)
                    v368 = v367;
                  else
                    v368 = v313;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v339);
                  v369 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v345);
                  v370 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v368);
                  v371 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v357);
                  v372 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v363);
                  v373 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v655, "objectForKeyedSubscript:", CFSTR("inputRawHighlights"));
                  v374 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary7();
                  v375 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CISmartToneFilter"), v684, v375, CFSTR("inputHighlights"), v372, CFSTR("inputBlack"), v373, CFSTR("inputRawHighlights"), v374);
                  v676 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("smartColor"));
                v654 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v654, "isEnabled"))
                {
                  v376 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v654, "objectForKeyedSubscript:", CFSTR("inputCast"));
                  v720 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v720, "doubleValue");
                  v378 = v377;
                  objc_msgSend(v654, "objectForKeyedSubscript:", CFSTR("offsetCast"));
                  v712 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v712, "doubleValue");
                  objc_msgSend(v376, "numberWithDouble:", v378 + v379);
                  v380 = (void *)objc_claimAutoreleasedReturnValue();
                  v381 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v654, "objectForKeyedSubscript:", CFSTR("inputSaturation"));
                  v382 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v382, "doubleValue");
                  v384 = v383;
                  objc_msgSend(v654, "objectForKeyedSubscript:", CFSTR("offsetSaturation"));
                  v385 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v385, "doubleValue");
                  objc_msgSend(v381, "numberWithDouble:", v384 + v386);
                  v387 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary3();
                  v388 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CISmartColorFilter"), v684, v388);
                  v389 = (void *)objc_claimAutoreleasedReturnValue();

                  v390 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v654, "objectForKeyedSubscript:", CFSTR("inputContrast"));
                  v391 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v391, "doubleValue");
                  v393 = v392;
                  objc_msgSend(v654, "objectForKeyedSubscript:", CFSTR("offsetContrast"));
                  v394 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v394, "doubleValue");
                  objc_msgSend(v390, "numberWithDouble:", v393 + v395);
                  v396 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary2();
                  v397 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CIVibrance"), v684, v397);
                  v676 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                }
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("pre-Curves"), v676, v263);
                v656 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v263 && *v263)
                {
                  v86 = 0;
LABEL_552:

                  v676 = v656;
                  goto LABEL_553;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("curves"));
                v652 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v652, "isEnabled"))
                {
                  objc_msgSend(v652, "objectForKeyedSubscript:", CFSTR("pointsR"));
                  v398 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v652, "objectForKeyedSubscript:", CFSTR("pointsG"));
                  v399 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v652, "objectForKeyedSubscript:", CFSTR("pointsB"));
                  v400 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v652, "objectForKeyedSubscript:", CFSTR("pointsL"));
                  v401 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary4();
                  v402 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PICurvesLUTFilter"), v684, v402);
                  v403 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary3();
                  v404 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PICurvesFilter"), v684, v404);
                  v405 = objc_claimAutoreleasedReturnValue();

                  v656 = (PISemanticStyleRenderNode *)v405;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("selectiveColor"));
                v653 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v653, "isEnabled"))
                {
                  objc_msgSend(v653, "objectForKeyedSubscript:", CFSTR("corrections"));
                  v662 = (void *)objc_claimAutoreleasedReturnValue();
                  v658 = objc_msgSend(v662, "count");
                  if (v658)
                  {
                    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    v660 = (void *)objc_claimAutoreleasedReturnValue();
                    for (i = 0; i != v658; ++i)
                    {
                      objc_msgSend(v662, "objectAtIndexedSubscript:", i);
                      v407 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("red"));
                      v713 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("green"));
                      v708 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("blue"));
                      v408 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("spread"));
                      v409 = (void *)objc_claimAutoreleasedReturnValue();
                      v410 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("hueShift"));
                      v721 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v721, "doubleValue");
                      objc_msgSend(v410, "numberWithDouble:", v411 / 60.0);
                      v678 = (void *)objc_claimAutoreleasedReturnValue();
                      v412 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("saturation"));
                      v705 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v705, "doubleValue");
                      objc_msgSend(v412, "numberWithDouble:", v413 / 100.0);
                      v414 = (void *)objc_claimAutoreleasedReturnValue();
                      v415 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v407, "objectForKeyedSubscript:", CFSTR("luminance"));
                      v416 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v416, "doubleValue");
                      objc_msgSend(v415, "numberWithDouble:", v417 / 70.0);
                      v418 = (void *)objc_claimAutoreleasedReturnValue();
                      NUMakeDictionary7();
                      v419 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v660, "addObject:", v419, CFSTR("hueShift"), v678, CFSTR("saturation"), v414, CFSTR("luminance"), v418);

                    }
                    NUMakeDictionary2();
                    v420 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PISelectiveColorFilter"), v684, v420);
                    v421 = objc_claimAutoreleasedReturnValue();

                    v656 = (PISemanticStyleRenderNode *)v421;
                  }

                }
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("pre-Levels"), v656, v263);
                v422 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                {
                  v86 = 0;
LABEL_551:

                  v656 = v422;
                  goto LABEL_552;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("levels"));
                v709 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v709, "isEnabled"))
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v423 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v422, CFSTR("inputImage"));
                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("colorSpace"));
                  v424 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v424, CFSTR("inputColorSpace"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("blackSrcRGB"));
                  v425 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v425, CFSTR("inputBlackSrcRGB"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("blackDstRGB"));
                  v426 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v426, CFSTR("inputBlackDstRGB"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("shadowSrcRGB"));
                  v427 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v427, CFSTR("inputShadowSrcRGB"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("shadowDstRGB"));
                  v428 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v428, CFSTR("inputShadowDstRGB"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("midSrcRGB"));
                  v429 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v429, CFSTR("inputMidSrcRGB"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("midDstRGB"));
                  v430 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v430, CFSTR("inputMidDstRGB"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("hilightSrcRGB"));
                  v431 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v431, CFSTR("inputHilightSrcRGB"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("hilightDstRGB"));
                  v432 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v432, CFSTR("inputHilightDstRGB"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("whiteSrcRGB"));
                  v433 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v433, CFSTR("inputWhiteSrcRGB"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("whiteDstRGB"));
                  v434 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v434, CFSTR("inputWhiteDstRGB"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("blackSrcRed"));
                  v435 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v435, CFSTR("inputBlackSrcRed"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("blackDstRed"));
                  v436 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v436, CFSTR("inputBlackDstRed"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("shadowSrcRed"));
                  v437 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v437, CFSTR("inputShadowSrcRed"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("shadowDstRed"));
                  v438 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v438, CFSTR("inputShadowDstRed"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("midSrcRed"));
                  v439 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v439, CFSTR("inputMidSrcRed"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("midDstRed"));
                  v440 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v440, CFSTR("inputMidDstRed"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("hilightSrcRed"));
                  v441 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v441, CFSTR("inputHilightSrcRed"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("hilightDstRed"));
                  v442 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v442, CFSTR("inputHilightDstRed"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("whiteSrcRed"));
                  v443 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v443, CFSTR("inputWhiteSrcRed"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("whiteDstRed"));
                  v444 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v444, CFSTR("inputWhiteDstRed"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("blackSrcGreen"));
                  v445 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v445, CFSTR("inputBlackSrcGreen"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("blackDstGreen"));
                  v446 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v446, CFSTR("inputBlackDstGreen"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("shadowSrcGreen"));
                  v447 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v447, CFSTR("inputShadowSrcGreen"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("shadowDstGreen"));
                  v448 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v448, CFSTR("inputShadowDstGreen"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("midSrcGreen"));
                  v449 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v449, CFSTR("inputMidSrcGreen"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("midDstGreen"));
                  v450 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v450, CFSTR("inputMidDstGreen"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("hilightSrcGreen"));
                  v451 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v451, CFSTR("inputHilightSrcGreen"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("hilightDstGreen"));
                  v452 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v452, CFSTR("inputHilightDstGreen"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("whiteSrcGreen"));
                  v453 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v453, CFSTR("inputWhiteSrcGreen"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("whiteDstGreen"));
                  v454 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v454, CFSTR("inputWhiteDstGreen"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("blackSrcBlue"));
                  v455 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v455, CFSTR("inputBlackSrcBlue"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("blackDstBlue"));
                  v456 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v456, CFSTR("inputBlackDstBlue"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("shadowSrcBlue"));
                  v457 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v457, CFSTR("inputShadowSrcBlue"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("shadowDstBlue"));
                  v458 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v458, CFSTR("inputShadowDstBlue"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("midSrcBlue"));
                  v459 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v459, CFSTR("inputMidSrcBlue"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("midDstBlue"));
                  v460 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v460, CFSTR("inputMidDstBlue"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("hilightSrcBlue"));
                  v461 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v461, CFSTR("inputHilightSrcBlue"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("hilightDstBlue"));
                  v462 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v462, CFSTR("inputHilightDstBlue"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("whiteSrcBlue"));
                  v463 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v463, CFSTR("inputWhiteSrcBlue"));

                  objc_msgSend(v709, "objectForKeyedSubscript:", CFSTR("whiteDstBlue"));
                  v464 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v423, "setObject:forKeyedSubscript:", v464, CFSTR("inputWhiteDstBlue"));

                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PILevelsFilter"), v684, v423);
                  v465 = objc_claimAutoreleasedReturnValue();

                  v422 = (PISemanticStyleRenderNode *)v465;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("smartBlackAndWhite"));
                v466 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v466, "isEnabled"))
                {
                  objc_msgSend(v466, "objectForKeyedSubscript:", CFSTR("grain"));
                  v467 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v467, "doubleValue");
                  v469 = v468;

                  objc_msgSend(v466, "objectForKeyedSubscript:", CFSTR("hue"));
                  v470 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v466, "objectForKeyedSubscript:", CFSTR("strength"));
                  v471 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v466, "objectForKeyedSubscript:", CFSTR("neutral"));
                  v472 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v466, "objectForKeyedSubscript:", CFSTR("tone"));
                  v473 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D52268], "scaleMultiplyOfScalar:", v469);
                  v474 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D52268], "grainInputSeedFromFrameTime");
                  v475 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary7();
                  v476 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CISmartBlackAndWhite"), v684, v476, CFSTR("inputTone"), v473, CFSTR("inputGrain"), v474, CFSTR("inputSeed"), v475);
                  v477 = objc_claimAutoreleasedReturnValue();

                  v422 = (PISemanticStyleRenderNode *)v477;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("sharpen"));
                v706 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v706, "isEnabled"))
                {
                  objc_msgSend(v706, "objectForKeyedSubscript:", CFSTR("falloff"));
                  v478 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v478, "doubleValue");
                  v480 = v479;

                  objc_msgSend(v706, "objectForKeyedSubscript:", CFSTR("intensity"));
                  v481 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v481, "doubleValue");
                  v483 = v482;

                  v484 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52050]), "initWithInput:", v422);
                  v485 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v706, "objectForKeyedSubscript:", CFSTR("edges"));
                  v486 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v486, "doubleValue");
                  objc_msgSend(v485, "numberWithDouble:", v487 * 5.5);
                  v488 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D52268], "scaleMultiplyOfScalar:", v480);
                  v489 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D52268], "sharpnessWithIntensity:", v483);
                  v490 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary4();
                  v491 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CIProSharpenEdges"), v684, v491);
                  v492 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                  -[NURenderNode outputImageGeometry:](v492, "outputImageGeometry:", v674);
                  v722 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v674 && *v674)
                  {
                    v86 = 0;
LABEL_550:

                    v422 = v492;
                    goto LABEL_551;
                  }
                  memset(v746, 0, sizeof(v746));
                  if (v722)
                    objc_msgSend(v722, "extent");
                  *(_OWORD *)v745 = *(_OWORD *)v746;
                  *(_OWORD *)&v745[16] = *(_OWORD *)&v746[16];
                  objc_msgSend(v728, "cropNode:cropRect:cropSettings:", v492, v745, 0);
                  v422 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("definition"));
                v722 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v722, "isEnabled"))
                {
                  v493 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v722, "objectForKeyedSubscript:", CFSTR("intensity"));
                  v494 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v494, "doubleValue");
                  objc_msgSend(v493, "numberWithDouble:", v495 + v495);
                  v496 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary2();
                  v497 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PILocalContrastHDR"), v684, v497);
                  v492 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                  -[NURenderNode outputImageGeometry:](v492, "outputImageGeometry:", v674);
                  v714 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v674 && *v674)
                  {
                    v86 = 0;
LABEL_549:

                    goto LABEL_550;
                  }
                  memset(v746, 0, sizeof(v746));
                  if (v714)
                    objc_msgSend(v714, "extent");
                  *(_OWORD *)v745 = *(_OWORD *)v746;
                  *(_OWORD *)&v745[16] = *(_OWORD *)&v746[16];
                  objc_msgSend(v728, "cropNode:cropRect:cropSettings:", v492, v745, 0);
                  v422 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("effect"));
                v714 = (void *)objc_claimAutoreleasedReturnValue();
                if (v714)
                {
                  v498 = v422;
                  v499 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v714, "objectForKeyedSubscript:", CFSTR("kind"));
                  v500 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v499, "stringWithFormat:", CFSTR("CIPhotoEffect%@"), v500);
                  v501 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v714, "objectForKeyedSubscript:", CFSTR("version"));
                  v502 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary2();
                  v503 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", v501, v684, v503);
                  v422 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v714, "objectForKeyedSubscript:", CFSTR("intensity"));
                  v504 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v504)
                  {
                    objc_msgSend(v714, "objectForKeyedSubscript:", CFSTR("intensity"));
                    v505 = (void *)objc_claimAutoreleasedReturnValue();
                    NUMakeDictionary4();
                    v506 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CIDissolveTransition"), v684, v506);
                    v507 = objc_claimAutoreleasedReturnValue();

                    v422 = (PISemanticStyleRenderNode *)v507;
                  }

                }
                if (v666)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v508 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v669, "objectForKeyedSubscript:", CFSTR("kind"));
                  v509 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v508, "setObject:forKeyedSubscript:", v509, CFSTR("kind"));

                  objc_msgSend(v669, "objectForKeyedSubscript:", CFSTR("intensity"));
                  v510 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v508, "setObject:forKeyedSubscript:", v510, CFSTR("intensity"));

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v684);
                  v511 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v508, "setObject:forKeyedSubscript:", v511, CFSTR("isHDR"));

                  v512 = -[PIPhotoEffect3DNode initWithInput:blurMap:settings:]([PIPhotoEffect3DNode alloc], "initWithInput:blurMap:settings:", v422, v671, v508);
                  v422 = (PISemanticStyleRenderNode *)v512;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("grain"));
                v679 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v679, "isEnabled"))
                {
                  objc_msgSend(v679, "objectForKeyedSubscript:", CFSTR("amount"));
                  v513 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v513, "doubleValue");
                  v515 = v514;

                  objc_msgSend(v679, "objectForKeyedSubscript:", CFSTR("iso"));
                  v516 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v679, "objectForKeyedSubscript:", CFSTR("seed"));
                  v517 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v517)
                    objc_msgSend(v679, "objectForKeyedSubscript:", CFSTR("seed"));
                  else
                    objc_msgSend(MEMORY[0x1E0D52268], "grainInputSeedFromFrameTime");
                  v518 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D52268], "scaleMultiplyOfScalar:", v515);
                  v519 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary4();
                  v520 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CIPhotoGrain"), v684, v520);
                  v521 = objc_claimAutoreleasedReturnValue();

                  v422 = (PISemanticStyleRenderNode *)v521;
                }
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("pre-VideoStabilize"), v422, v674);
                v492 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                {
                  v86 = 0;
LABEL_548:

                  goto LABEL_549;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("videoStabilize"));
                v667 = (void *)objc_claimAutoreleasedReturnValue();
                if (v667 && objc_msgSend(v667, "isEnabled"))
                {
                  objc_msgSend(v728, "videoReframe:reframes:error:", v492, v667, v674);
                  v522 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                  if (v674 && *v674)
                    goto LABEL_413;
                  v492 = v522;
                }
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("VideoStabilize"), v492, v674);
                v522 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                {
LABEL_413:
                  v86 = 0;
LABEL_547:

                  v492 = v522;
                  goto LABEL_548;
                }
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("pre-VideoCrossfadeLoop"), v522, v674);
                v523 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                {
                  v86 = 0;
                  v522 = v523;
                  goto LABEL_547;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("videoCrossfadeLoop"));
                v663 = (void *)objc_claimAutoreleasedReturnValue();
                if (v663 && objc_msgSend(v663, "isEnabled"))
                {
                  objc_msgSend(v728, "videoCrossfadeLoop:crossfadeAdjustment:error:", v523, v663, v674);
                  v522 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                  if (v674 && *v674)
                    goto LABEL_429;
                  v523 = v522;
                }
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("VideoCrossfadeLoop"), v523, v674);
                v522 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                  goto LABEL_429;
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("pre-Geometry"), v522, v674);
                v524 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                {
                  v86 = 0;
                  v522 = v524;
LABEL_546:

                  goto LABEL_547;
                }
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("pre-Crop"), v524, v674);
                v522 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674)
                {
                  if (*v674)
                  {
LABEL_429:
                    v86 = 0;
                    goto LABEL_546;
                  }
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("cropStraighten"));
                v659 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v659, "isEnabled"))
                {
                  -[NURenderNode outputImageGeometry:](v522, "outputImageGeometry:", v674);
                  v657 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v674 && *v674)
                    goto LABEL_478;
                  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("pitch"));
                  v525 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v525, "doubleValue");
                  v527 = v526;

                  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("yaw"));
                  v528 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v528, "doubleValue");
                  v530 = v529;

                  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("angle"));
                  v531 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v531, "doubleValue");
                  v533 = v532;

                  if (v527 == 0.0 && v530 == 0.0)
                  {
                    if (v657)
                      objc_msgSend(v657, "extent");
                    else
                      memset(v744, 0, 32);
                    objc_msgSend(v728, "straightenTransformWithAngle:extent:", v744, v533);
                    v534 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    if (v657)
                      objc_msgSend(v657, "extent");
                    else
                      memset(&v744[2], 0, 32);
                    NUPixelRectToCGRect();
                    objc_msgSend(v728, "perspectiveTransformWithPitch:yaw:roll:imageRect:", v527, v530, v533, v535, v536, v537, v538);
                    v534 = objc_claimAutoreleasedReturnValue();
                  }
                  v651 = (void *)v534;
                  objc_msgSend(MEMORY[0x1E0D52308], "transformNodeWithInput:transform:error:", v522, v534, v674);
                  v539 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                  if (v674 && *v674)
                  {
                    v86 = 0;
LABEL_543:

                    v522 = v539;
                    goto LABEL_544;
                  }
                  objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("perspectiveStraighten"), v539, v674);
                  v650 = (PICinematicAudioRenderNode *)objc_claimAutoreleasedReturnValue();

                  if (v674 && *v674)
                  {
                    v86 = 0;
LABEL_542:
                    v539 = (PISemanticStyleRenderNode *)v650;
                    goto LABEL_543;
                  }
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", &unk_1E50592F0);
                  v661 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v688)
                  {
                    -[NURenderNode videoProperties:](v650, "videoProperties:", v674);
                    v540 = (void *)objc_claimAutoreleasedReturnValue();
                    v541 = v540;
                    if (v674 && *v674)
                    {

LABEL_540:
                      v86 = 0;
LABEL_541:

                      goto LABEL_542;
                    }
                    if (v540)
                    {
                      memset(v746, 0, sizeof(v746));
                      objc_msgSend(v540, "originalCleanAperture");
                      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v746, "{?={?=qq}{?=qq}}");
                      v542 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v661, "setObject:forKeyedSubscript:", v542, CFSTR("projectUsingCleanAperture"));

                      *(_OWORD *)v745 = 0uLL;
                      *(_QWORD *)v745 = objc_msgSend(v541, "originalSize");
                      *(_QWORD *)&v745[8] = v543;
                      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v745, "{?=qq}");
                      v544 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v661, "setObject:forKeyedSubscript:", v544, CFSTR("projectUsingOriginalSize"));

                      v742 = 0u;
                      v743 = 0u;
                      v740 = 0u;
                      v741 = 0u;
                      objc_msgSend(v541, "metadata");
                      v545 = (void *)objc_claimAutoreleasedReturnValue();
                      v546 = objc_msgSend(v545, "countByEnumeratingWithState:objects:count:", &v740, v760, 16);
                      if (v546)
                      {
                        v547 = v546;
                        v548 = *(_QWORD *)v741;
                        do
                        {
                          for (j = 0; j != v547; ++j)
                          {
                            if (*(_QWORD *)v741 != v548)
                              objc_enumerationMutation(v545);
                            objc_msgSend(*(id *)(*((_QWORD *)&v740 + 1) + 8 * j), "key");
                            v550 = (void *)objc_claimAutoreleasedReturnValue();
                            v551 = objc_msgSend(v550, "isEqual:", CFSTR("com.apple.quicktime.live-photo.vitality-disabled"));

                            if (v551)
                              objc_msgSend(v661, "setObject:forKeyedSubscript:", &unk_1E5052008, CFSTR("projectUsingEstimatedCleanAperture"));
                          }
                          v547 = objc_msgSend(v545, "countByEnumeratingWithState:objects:count:", &v740, v760, 16);
                        }
                        while (v547);
                      }

                    }
                  }
                  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("xOrigin"));
                  v552 = (void *)objc_claimAutoreleasedReturnValue();
                  v553 = objc_msgSend(v552, "integerValue");
                  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("yOrigin"));
                  v554 = (void *)objc_claimAutoreleasedReturnValue();
                  v555 = objc_msgSend(v554, "integerValue");
                  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("width"));
                  v556 = (void *)objc_claimAutoreleasedReturnValue();
                  v557 = objc_msgSend(v556, "integerValue");
                  objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("height"));
                  v558 = (void *)objc_claimAutoreleasedReturnValue();
                  v559 = objc_msgSend(v558, "integerValue");

                  *(_QWORD *)v746 = v553;
                  *(_QWORD *)&v746[8] = v555;
                  *(_QWORD *)&v746[16] = v557;
                  *(_QWORD *)&v746[24] = v559;
                  objc_msgSend(v728, "cropNode:cropRect:cropSettings:", v650, v746, v661);
                  v522 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                }
                v560 = v522;
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("Crop"), v522, v674);
                v522 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                {
                  v86 = 0;
LABEL_545:

                  goto LABEL_546;
                }
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("pre-Orientation"), v522, v674);
                v561 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                {
                  v86 = 0;
                  v522 = v561;
                  goto LABEL_545;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("orientation"));
                v657 = (void *)objc_claimAutoreleasedReturnValue();
                if (v657)
                {
                  objc_msgSend(v657, "objectForKeyedSubscript:", CFSTR("value"));
                  v562 = (void *)objc_claimAutoreleasedReturnValue();
                  v563 = objc_msgSend(v562, "integerValue");

                  objc_msgSend(v728, "orientedNode:withOrientation:", v561, v563);
                  v522 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                  if (v674 && *v674)
                    goto LABEL_478;
                  v561 = v522;
                }
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("Orientation"), v561, v674);
                v522 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                {
LABEL_478:
                  v86 = 0;
LABEL_544:

                  goto LABEL_545;
                }
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("post-Geometry"), v522, v674);
                v564 = (PICinematicAudioRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                {
                  v86 = 0;
                  v522 = (PISemanticStyleRenderNode *)v564;
                  goto LABEL_544;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("cinematicAudio"));
                v651 = (void *)objc_claimAutoreleasedReturnValue();
                if (_os_feature_enabled_impl()
                  && objc_msgSend(v651, "isEnabled")
                  && (objc_msgSend(valuea, "isEnabled") & 1) == 0)
                {
                  objc_msgSend(v651, "objectForKeyedSubscript:", CFSTR("dialogMixBias"));
                  v568 = objc_claimAutoreleasedReturnValue();
                  v569 = (void *)v568;
                  v570 = &unk_1E5052018;
                  if (v568)
                    v570 = (void *)v568;
                  v571 = v570;

                  objc_msgSend(v651, "objectForKeyedSubscript:", CFSTR("renderingStyle"));
                  v572 = objc_claimAutoreleasedReturnValue();
                  v573 = (void *)v572;
                  v574 = CFSTR("original");
                  if (v572)
                    v574 = (__CFString *)v572;
                  v566 = v574;

                  v575 = [PICinematicAudioRenderNode alloc];
                  v661 = v571;
                  objc_msgSend(v571, "doubleValue");
                  v650 = -[PICinematicAudioRenderNode initWithInput:dialogMixBias:renderingStyle:](v575, "initWithInput:dialogMixBias:renderingStyle:", v564, v566);

                  if (v674 && *v674)
                    goto LABEL_539;

                }
                else
                {
                  v650 = v564;
                }
                objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("vignette"));
                v661 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v661, "isEnabled"))
                {
                  -[NURenderNode outputImageGeometry:](v650, "outputImageGeometry:", v674);
                  v565 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v566 = v565;
                  if (v674 && *v674)
                    goto LABEL_539;
                  if (v565)
                  {
                    -[__CFString extent](v565, "extent");
                    v567 = v739;
                  }
                  else
                  {
                    v567 = 0;
                  }
                  v576 = (double)v567;
                  v577 = (double)-[__CFString size](v566, "size");
                  if (v566)
                  {
                    -[__CFString extent](v566, "extent");
                    v578 = v738;
                  }
                  else
                  {
                    v578 = 0;
                  }
                  v579 = v576 + v577 * 0.5;
                  v580 = (double)v578;
                  -[__CFString size](v566, "size");
                  v582 = v580 + (double)v581 * 0.5;
                  objc_msgSend(v661, "objectForKeyedSubscript:", CFSTR("falloff"));
                  v583 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v583, "doubleValue");
                  v585 = v584;

                  objc_msgSend(v661, "objectForKeyedSubscript:", CFSTR("intensity"));
                  v586 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v586, "doubleValue");
                  v588 = v587;

                  objc_msgSend(v661, "objectForKeyedSubscript:", CFSTR("radius"));
                  v589 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v589, "doubleValue");
                  v591 = 1.0 - v590;

                  if (v588 >= 0.0)
                  {
                    v592 = pow(v588, 0.6);
                    v593 = (v591 + -0.5) * 0.3 + 0.5;
                  }
                  else
                  {
                    v592 = -pow(-v588, 0.6);
                    v593 = (v591 + -0.5) * 0.4 + 0.7;
                  }
                  -[__CFString size](v566, "size");
                  v595 = (double)v594;
                  v596 = (double)-[__CFString size](v566, "size");
                  v597 = -[__CFString size](v566, "size");
                  if (v595 <= v596)
                    v599 = v597;
                  else
                    v599 = v598;
                  v600 = v593 * (double)v599;
                  v601 = (void *)MEMORY[0x1E0D52268];
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v579);
                  v602 = (void *)objc_claimAutoreleasedReturnValue();
                  v759[0] = v602;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v582);
                  v603 = (void *)objc_claimAutoreleasedReturnValue();
                  v759[1] = v603;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v759, 2);
                  v689 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v601, "scaledVector:", v689);
                  v604 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v592);
                  v605 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D52268], "scaleMultiplyOfScalar:", v600);
                  v606 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v585);
                  v607 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary5();
                  v608 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CIVignetteEffect"), v684, v608, CFSTR("inputFalloff"), v607);
                  v649 = objc_claimAutoreleasedReturnValue();

                  v650 = (PICinematicAudioRenderNode *)v649;
                }
                v609 = v650;
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("post-Adjustments"), v650, v674);
                v650 = (PICinematicAudioRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                  goto LABEL_540;
                if (v696)
                {
                  objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("raw_applyFirst"));
                  v610 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v610, "BOOLValue") & 1) == 0)
                  {
                    +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
                    v611 = (void *)objc_claimAutoreleasedReturnValue();
                    v612 = objc_msgSend(v611, "rawApplyBoostFirst");

                    if ((v612 & 1) != 0)
                      goto LABEL_516;
                    objc_msgSend(v732, "objectForKeyedSubscript:", CFSTR("boostAmount"));
                    v613 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v732, "objectForKeyedSubscript:", CFSTR("boostVersion"));
                    v614 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v732, "objectForKeyedSubscript:", CFSTR("boostParams"));
                    v615 = (void *)objc_claimAutoreleasedReturnValue();
                    NUMakeDictionary4();
                    v616 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PIInverseFakeBoost"), v684, v616);
                    v610 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v728, "resetTag:input:", CFSTR("Master/RAW/Linear"), v610);
                    v650 = v686;
                  }

                }
LABEL_516:
                objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("outputExposure"));
                v617 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v617, "doubleValue");
                v619 = v618;

                if (v619 != 0.0)
                {
                  objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("outputExposure"));
                  v620 = (void *)objc_claimAutoreleasedReturnValue();
                  NUMakeDictionary2();
                  v621 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v728, "nodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("CIExposureAdjust"), v684, v621);
                  v622 = objc_claimAutoreleasedReturnValue();

                  v650 = (PICinematicAudioRenderNode *)v622;
                }
                objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("headroomAdjust"));
                v623 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v623, "doubleValue");
                v625 = v624;

                if (v625 != 0.0)
                {
                  objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("headroomAdjust"));
                  v626 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v626, "floatValue");
                  v628 = v627;

                  objc_msgSend(v728, "gainMapHeadroomNode:headroomOffset:", v650, v628);
                  v629 = objc_claimAutoreleasedReturnValue();

                  v650 = (PICinematicAudioRenderNode *)v629;
                }
                objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("falseColorHDR"));
                v630 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v630, "doubleValue");
                if (v631 == 0.0)
                {
                  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
                  v632 = (void *)objc_claimAutoreleasedReturnValue();
                  v633 = objc_msgSend(v632, "falseColorHDR");

                  if (!v633)
                    goto LABEL_528;
                }
                else
                {

                }
                objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("falseColorHDR"));
                v634 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v634, "doubleValue");
                if (v635 == 0.0)
                {
                  v636 = &unk_1E5051FF8;
                }
                else
                {
                  objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("falseColorHDR"));
                  v636 = (id)objc_claimAutoreleasedReturnValue();

                }
                NUMakeDictionary2();
                v637 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v728, "debugNodeByApplyingFilterWithName:useHDRFilter:settingsAndInputs:", CFSTR("PIFalseColorHDRDebug"), v684, v637);
                v638 = objc_claimAutoreleasedReturnValue();

                v650 = (PICinematicAudioRenderNode *)v638;
LABEL_528:
                v639 = v650;
                objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("Image"), v650, v674);
                v650 = (PICinematicAudioRenderNode *)objc_claimAutoreleasedReturnValue();

                if (v674 && *v674)
                  goto LABEL_540;
                objc_msgSend(v734, "objectForKeyedSubscript:", CFSTR("useStyleEngine"));
                v640 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v640, "BOOLValue"))
                {

                }
                else
                {
                  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
                  v641 = (void *)objc_claimAutoreleasedReturnValue();
                  v642 = objc_msgSend(v641, "debugUseStyleEngine");

                  if (!v642)
                    goto LABEL_573;
                }
                objc_msgSend(v728, "getTagWithPath:error:", CFSTR("masterSpace"), v674);
                v566 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (v674)
                {
                  if (*v674)
                  {
                    v643 = 0;
LABEL_538:

LABEL_539:
                    goto LABEL_540;
                  }
                  objc_msgSend(v728, "getTagWithPath:error:", CFSTR("pre-Geometry"), v674);
                  v643 = (void *)objc_claimAutoreleasedReturnValue();
                  if (*v674)
                    goto LABEL_538;
                }
                else
                {
                  objc_msgSend(v728, "getTagWithPath:error:", CFSTR("pre-Geometry"), 0);
                  v643 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v645 = (void *)MEMORY[0x1E0D52270];
                objc_msgSend(v643, "inputs");
                v646 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v646, "objectForKeyedSubscript:", *MEMORY[0x1E0C9E1F8]);
                v647 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v645, "styleTransferNodeWithInput:target:settings:", v566, v647, MEMORY[0x1E0C9AA70]);
                v648 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v728, "resetTag:input:", CFSTR("pre-Geometry"), v648);
LABEL_573:
                v86 = v650;
                v650 = v86;
                goto LABEL_541;
              }
              v11 = v728;
LABEL_280:
              v233 = v677;
              goto LABEL_281;
            }
            v197 = objc_alloc(MEMORY[0x1E0D52208]);
            v198 = (void *)MEMORY[0x1E0CB3B18];
            if (v733)
            {
              objc_msgSend(v733, "time");
              if ((v752 & 0x100000000) != 0)
              {
                objc_msgSend(v733, "time");
LABEL_222:
                objc_msgSend(v198, "valueWithCMTime:", &v754);
                v199 = (void *)objc_claimAutoreleasedReturnValue();
                NUMakeDictionary2();
                v200 = (void *)objc_claimAutoreleasedReturnValue();
                NUMakeDictionary1();
                v201 = (void *)objc_claimAutoreleasedReturnValue();
                v202 = objc_msgSend(v197, "initWithSettings:inputs:", v200, v201);

                v189 = (PISemanticStyleRenderNode *)v202;
                a6 = v195;
                goto LABEL_223;
              }
            }
            else
            {
              v752 = 0;
              v751 = 0;
              v753 = 0;
            }
            v754 = v769;
            v755 = v770;
            v756 = value;
            v757 = v717;
            goto LABEL_222;
          }
          v691 = v43;
          if (v685)
          {
            v120 = -[PISemanticStyleApplyNode initWithInput:style:thumbnail:]([PISemanticStyleApplyNode alloc], "initWithInput:style:thumbnail:", v90, v685, 0);

            v90 = (PISemanticStyleRenderNode *)v120;
          }
          v121 = v90;
          objc_msgSend(v11, "cacheNode:type:settings:error:", v90, CFSTR("Video"), MEMORY[0x1E0C9AA70], a6);
          v90 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

          if (a6 && *a6)
          {
            v685 = 0;
            v86 = 0;
            v43 = v691;
            goto LABEL_157;
          }
          v672 = a6;
          objc_msgSend(v716, "objectForKeyedSubscript:", CFSTR("flavor"));
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v716, "objectForKeyedSubscript:", CFSTR("recipe"));
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          NUMakeDictionary2();
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = (PISemanticStyleRenderNode *)objc_msgSend(v124, "mutableCopy");

          if (objc_msgSend(v45, "isEnabled"))
          {
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("start"));
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("end"));
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("startScale"));
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("endScale"));
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            NUMakeDictionary4();
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            -[PISemanticStyleRenderNode setObject:forKeyedSubscript:](v125, "setObject:forKeyedSubscript:", v130, CFSTR("trim"));

          }
          v11 = v728;
          v681 = v125;
          a6 = v672;
          objc_msgSend(v728, "cacheNode:type:settings:error:", v90, CFSTR("AutoLoop"), v125, v672);
          v131 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

          if (v672 && *v672)
          {
            v685 = 0;
            v86 = 0;
            v43 = v691;
            v44 = v703;
            v90 = v131;
            v94 = v694;
            v92 = v695;
LABEL_563:
            v107 = v681;
            goto LABEL_564;
          }
          objc_msgSend(v716, "objectForKeyedSubscript:", CFSTR("flavor"));
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = objc_msgSend(v132, "isEqualToString:", CFSTR("LongExposure"));

          v134 = v125;
          if (v133)
          {
            v43 = v691;
            if (v735 == 1)
            {
              objc_msgSend(v737, "objectForKeyedSubscript:", CFSTR("highResFusion"));
              v680 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();
              v44 = v703;
              v11 = v728;
              if (-[PISemanticStyleRenderNode isEnabled](v680, "isEnabled"))
                objc_msgSend(v728, "performLongExposureFusionForComposition:longExposureImage:useHDRFilter:error:", v737, v131, v684, v672);
              else
                objc_msgSend(v728, "scaleNode:scale:error:", v131, *MEMORY[0x1E0D51F70], *(_QWORD *)(MEMORY[0x1E0D51F70] + 8), v672);
              v90 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

              if (v672 && *v672)
              {
                v685 = 0;
                v86 = 0;
                v94 = v694;
                v92 = v695;
LABEL_562:

                goto LABEL_563;
              }

              v131 = v90;
              v134 = v681;
              goto LABEL_148;
            }
            v11 = v728;
          }
          else
          {
            v11 = v728;
            v43 = v691;
          }
          v44 = v703;
LABEL_148:

          v685 = 0;
          v90 = v131;
          v83 = v693;
          goto LABEL_149;
        }
        v107 = (PISemanticStyleRenderNode *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v693, "objectForKeyedSubscript:", CFSTR("tone"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        -[PISemanticStyleRenderNode setObject:forKeyedSubscript:](v107, "setObject:forKeyedSubscript:", v108, CFSTR("tone"));

        objc_msgSend(v693, "objectForKeyedSubscript:", CFSTR("color"));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[PISemanticStyleRenderNode setObject:forKeyedSubscript:](v107, "setObject:forKeyedSubscript:", v109, CFSTR("color"));

        objc_msgSend(v693, "objectForKeyedSubscript:", CFSTR("cast"));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        -[PISemanticStyleRenderNode setObject:forKeyedSubscript:](v107, "setObject:forKeyedSubscript:", v110, CFSTR("cast"));

        objc_msgSend(v693, "objectForKeyedSubscript:", CFSTR("intensity"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        -[PISemanticStyleRenderNode setObject:forKeyedSubscript:](v107, "setObject:forKeyedSubscript:", v111, CFSTR("intensity"));

        objc_msgSend(v693, "objectForKeyedSubscript:", CFSTR("debugMode"));
        v112 = objc_claimAutoreleasedReturnValue();
        -[PISemanticStyleRenderNode setObject:forKeyedSubscript:](v107, "setObject:forKeyedSubscript:", v112, CFSTR("debugMode"));

        objc_msgSend(v693, "objectForKeyedSubscript:", CFSTR("debugDisableStyleEngine"));
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = objc_msgSend(v113, "BOOLValue");

        +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v112) = objc_msgSend(v115, "semanticStyleDisableStyleEngine");

        if ((v112 & 1) != 0 || v114)
        {
          v116 = -[PISemanticStyleRenderNode initWithInput:settings:]([PISemanticStyleRenderNode alloc], "initWithInput:settings:", v90, v107);

          v685 = 0;
          v11 = v728;
        }
        else
        {
          v116 = v90;
          v117 = -[PISemanticStyleRenderNode initWithInput:settings:]([PISemanticStyleLearnNode alloc], "initWithInput:settings:", v90, v107);
          v11 = v728;
          v118 = (id)objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("semanticStyleLearn"), v117, a6);
          v685 = v117;
          if (a6)
          {
            v43 = v690;
            if (*a6)
            {
              v86 = 0;
              v45 = v698;
              v44 = v702;
LABEL_166:
              v90 = v116;
              v94 = v694;
              v92 = v695;
LABEL_564:

              v83 = v693;
              goto LABEL_565;
            }
            goto LABEL_120;
          }
        }
        v43 = v690;
LABEL_120:
        v44 = v702;

        v45 = v698;
        v83 = v693;
        goto LABEL_121;
      }
      v693 = v83;
      v698 = v45;
      v702 = v44;
      v95 = v90;
    }
    else
    {
      v693 = v83;
      objc_msgSend(v728, "addTagWithName:inputNode:error:", CFSTR("Source"), v90, a6);
      v95 = (PISemanticStyleRenderNode *)objc_claimAutoreleasedReturnValue();

      if (a6)
      {
        v696 = 0;
        if (*a6)
        {
          v90 = v95;
          v86 = 0;
LABEL_87:
          v94 = v694;
          v92 = v695;
          v83 = v693;
          goto LABEL_568;
        }
        goto LABEL_85;
      }
      v698 = v45;
      v702 = v44;
      v696 = 0;
    }
    v690 = v43;
    objc_msgSend(v728, "endGroupWithName:error:", CFSTR("Master"), 0);
    -[NURenderNode imageProperties:](v95, "imageProperties:", 0);
    v687 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_90;
  }
  v86 = 0;
LABEL_571:

  return v86;
}

__CFString *__61__PIModernPhotosPipeline_evaluate_input_pipelineState_error___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "auxiliaryImageType") == 1)
    return CFSTR("retouchedImage");
  else
    return CFSTR("image");
}

@end
