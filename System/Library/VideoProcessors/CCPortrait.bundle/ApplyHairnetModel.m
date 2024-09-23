@implementation ApplyHairnetModel

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  float v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  float v38;
  float v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  CFAbsoluteTime Current;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  const char *v63;
  unint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  CFAbsoluteTime v95;
  const char *v96;
  const char *v97;
  const char *v98;
  const char *v99;
  const char *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  void *v106;
  double v107;
  const char *v108;
  CFAbsoluteTime v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  id v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  const char *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  const char *v126;
  const char *v127;
  id v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  NSObject *v136;
  unint64_t v138;
  unint64_t v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  double v144;
  CGFloat v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  const char *v165;
  void *v166;
  const char *v167;
  void *v168;
  CFAbsoluteTime v169;
  const char *v170;
  uint64_t v171;
  double x;
  double y;
  double width;
  double height;
  id v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  double v185;
  double v186;
  const char *v187;
  uint64_t v188;
  double v189;
  double v190;
  const char *v191;
  uint64_t v192;
  double v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  int v199;
  _BOOL4 v200;
  const char *v201;
  uint64_t v202;
  double v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  BOOL v209;
  BOOL v210;
  BOOL v211;
  int v212;
  NSObject *v213;
  NSObject *v214;
  int v215;
  const char *v216;
  uint64_t v217;
  void *v218;
  void *v219;
  CFAbsoluteTime v220;
  const char *v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  void *v228;
  const char *v229;
  void *v230;
  const char *v231;
  void *v232;
  const char *v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  id v239;
  const char *v240;
  uint64_t v241;
  char v242;
  CFAbsoluteTime v243;
  const char *v244;
  const char *v245;
  NSObject *v246;
  id v247;
  NSObject *v248;
  const char *v249;
  const char *v250;
  const char *v251;
  const char *v252;
  CFAbsoluteTime v253;
  void *v254;
  const char *v255;
  void *v256;
  const char *v257;
  void *v258;
  const char *v259;
  const char *v260;
  uint64_t v261;
  double v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  double v268;
  double v269;
  const char *v270;
  void *v271;
  const char *v272;
  void *v273;
  const char *v274;
  void *v275;
  const char *v276;
  void *v277;
  id v278;
  const char *v279;
  const char *v280;
  uint64_t v281;
  void *v282;
  const char *v283;
  uint64_t v284;
  void *v285;
  id v286;
  uint64_t v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  double v291;
  CGFloat v292;
  double v293;
  CGFloat v294;
  double v295;
  CGFloat v296;
  double v297;
  CGFloat v298;
  double v299;
  double v300;
  double v301;
  double v302;
  const char *v303;
  uint64_t v304;
  void *v305;
  const char *v306;
  void *v307;
  const char *v308;
  void *v309;
  id v310;
  const char *v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double v319;
  double v320;
  double v321;
  double v322;
  const char *v323;
  void *v324;
  const char *v325;
  void *v326;
  id v327;
  const char *v328;
  id v329;
  void *v330;
  const char *v331;
  void *v332;
  id v333;
  const char *v334;
  uint64_t v335;
  double v336;
  double v337;
  double v338;
  double v339;
  double v340;
  double v341;
  double v342;
  double v343;
  const char *v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  void *v349;
  const char *v350;
  uint64_t v351;
  void *v352;
  const char *v353;
  void *v354;
  const char *v355;
  const char *v356;
  uint64_t v357;
  double v358;
  double v359;
  double v360;
  double v361;
  double v362;
  double v363;
  double v364;
  double v365;
  const char *v366;
  uint64_t v367;
  void *v368;
  const char *v369;
  void *v370;
  const char *v371;
  void *v372;
  const char *v373;
  CFAbsoluteTime v374;
  const char *v375;
  uint64_t v376;
  double v377;
  double v378;
  double v379;
  double v380;
  double v381;
  double v382;
  double v383;
  double v384;
  const char *v385;
  void *v386;
  const char *v387;
  void *v388;
  CFAbsoluteTime v389;
  const char *v390;
  uint64_t v391;
  void *v392;
  const char *v393;
  uint64_t v394;
  void *v395;
  const char *v396;
  uint64_t v397;
  void *v398;
  id v399;
  id v400;
  objc_class *v401;
  id v402;
  id v403;
  const char *v404;
  void *v405;
  const char *v406;
  const char *v407;
  const char *v408;
  uint64_t v409;
  void *v410;
  const char *v411;
  const char *v412;
  const char *v413;
  uint64_t v414;
  const char *v415;
  id v416;
  const char *v417;
  uint64_t v418;
  NSObject *v419;
  uint64_t v420;
  uint64_t v421;
  char v422;
  unint64_t v423;
  unint64_t v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  double v429;
  void *v430;
  uint64_t v431;
  unsigned int v432;
  uint64_t v433;
  uint64_t v434;
  id v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  void *v443;
  float v444;
  void *v445;
  void *v446;
  void *v447;
  int v448;
  void *v449;
  void *v450;
  void *v451;
  void *v452;
  void *v453;
  double v454;
  void *v455;
  uint64_t v456;
  void *v457;
  void *v458;
  unint64_t v459;
  double v460;
  id v461;
  void *v462;
  unint64_t v463;
  void *v464;
  id v465;
  void *v466;
  id v467;
  double r2;
  uint64_t v469;
  _QWORD block[5];
  _QWORD v471[4];
  NSObject *v472;
  _QWORD v473[5];
  _QWORD v474[2];
  uint64_t v475;
  void *v476;
  _QWORD v477[2];
  uint64_t v478;
  uint64_t v479;
  uint8_t v480[4];
  uint64_t v481;
  uint8_t v482[4];
  uint64_t v483;
  uint8_t v484[4];
  uint64_t v485;
  uint8_t v486[4];
  uint64_t v487;
  uint8_t v488[4];
  uint64_t v489;
  uint8_t v490[4];
  uint64_t v491;
  uint8_t v492[4];
  uint64_t v493;
  uint8_t v494[4];
  uint64_t v495;
  _QWORD v496[2];
  _QWORD v497[2];
  _QWORD v498[2];
  _QWORD v499[2];
  _QWORD v500[2];
  _QWORD v501[2];
  _QWORD v502[2];
  _QWORD v503[3];
  _QWORD v504[3];
  _QWORD v505[2];
  CGAffineTransform v506;
  uint64_t v507;
  CGRect v508;
  CGRect v509;
  CGRect v510;
  CGRect v511;
  CGRect v512;
  CGRect v513;
  CGRect v514;
  CGRect v515;

  v507 = *MEMORY[0x24BDAC8D0];
  v435 = a3;
  v8 = a4;
  v9 = a5;
  v445 = v8;
  objc_msgSend_objectForKeyedSubscript_(v8, v10, (uint64_t)CFSTR("fullWidth"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_unsignedLongValue(v11, v12, v13);

  objc_msgSend_objectForKeyedSubscript_(v445, v15, (uint64_t)CFSTR("fullHeight"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_unsignedLongValue(v16, v17, v18);

  objc_msgSend_objectForKeyedSubscript_(v445, v20, (uint64_t)CFSTR("tileSize"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v463 = objc_msgSend_unsignedLongValue(v21, v22, v23);

  objc_msgSend_objectForKeyedSubscript_(v445, v24, (uint64_t)CFSTR("tileOverlap"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_unsignedLongValue(v25, v26, v27);

  objc_msgSend_objectForKeyedSubscript_(v445, v29, (uint64_t)CFSTR("chromaWeight"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v30, v31, v32);
  v444 = v33;

  objc_msgSend_objectForKeyedSubscript_(v445, v34, (uint64_t)CFSTR("chromaBlurSigma"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v35, v36, v37);
  v39 = v38;

  v467 = v9;
  objc_msgSend_metalTexture(v467, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v42)
    sub_24B6EF404();

  objc_msgSend_objectForKeyedSubscript_(v445, v43, (uint64_t)CFSTR("model"));
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_objectAtIndexedSubscript_(v435, v45, 0, Current);
  v428 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v435, v46, 1);
  v427 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v435, v47, 2);
  v461 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v435, v48, 3);
  v426 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6CE910(v428);
  v453 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6CE910(v427);
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6CE910(v461);
  v452 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6CE910(v426);
  v451 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metalContext(v467, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v51;
  if (v51)
  {
    v465 = v51;
  }
  else
  {
    v55 = (void *)MEMORY[0x24BDBF648];
    objc_msgSend_metalContext(v467, v52, v53);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_internalCommandQueue(v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = *MEMORY[0x24BDBF818];
    v503[0] = *MEMORY[0x24BDBF838];
    v503[1] = v60;
    v504[0] = CFSTR("HairnetProcessor");
    v504[1] = MEMORY[0x24BDBD1C0];
    v503[2] = *MEMORY[0x24BDBF828];
    v504[2] = &unk_251C9CC78;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v61, (uint64_t)v504, v503, 3);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contextWithMTLCommandQueue_options_(v55, v63, (uint64_t)v59, v62);
    v465 = (id)objc_claimAutoreleasedReturnValue();

  }
  CFAbsoluteTimeGetCurrent();
  CFAbsoluteTimeGetCurrent();
  v502[1] = 0;
  v502[0] = 0;
  v64 = v463 + 2 * v28;
  v501[1] = 0;
  v501[0] = 0;
  v500[1] = 0;
  v500[0] = 0;
  v499[1] = 0;
  v499[0] = 0;
  v498[1] = 0;
  v498[0] = 0;
  sub_24B6CEA5C(v64, (const char *)(3 * v64), (uint64_t)v502);
  sub_24B6CEA5C(v64, (const char *)(3 * v64), (uint64_t)v501);
  sub_24B6CEA5C(v64, (const char *)v64, (uint64_t)v500);
  sub_24B6CEA5C(v64, (const char *)v64, (uint64_t)v499);
  sub_24B6CEA5C(v64, (const char *)(3 * v64), (uint64_t)v498);
  objc_msgSend_metalTexture(v467, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6CEB90(v70, (uint64_t)v502);
  v442 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_metalTexture(v467, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6CEB90(v76, (uint64_t)v501);
  v441 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_metalTexture(v467, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6CEB90(v82, (uint64_t)v500);
  v440 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_metalTexture(v467, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6CEB90(v88, (uint64_t)v499);
  v439 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_metalTexture(v467, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6CEB90(v94, (uint64_t)v498);
  v437 = (void *)objc_claimAutoreleasedReturnValue();

  CFAbsoluteTimeGetCurrent();
  v95 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v96, (uint64_t)CFSTR("addR"), v95);
  v436 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v97, (uint64_t)CFSTR("multiply_weight"));
  v447 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v98, (uint64_t)CFSTR("make_corrupt"));
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v99, (uint64_t)CFSTR("weights"));
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v100, v64);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v497[0] = v101;
  v454 = (double)(unint64_t)v28;
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v102, v103, v454 + v454);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v497[1] = v104;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v105, (uint64_t)v497, 2);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = (double)v64;
  objc_msgSend_applyWithExtent_arguments_(v425, v108, (uint64_t)v106, 0.0, 0.0, (double)v64, (double)v64);
  v446 = (void *)objc_claimAutoreleasedReturnValue();

  CFAbsoluteTimeGetCurrent();
  v109 = CFAbsoluteTimeGetCurrent();
  objc_msgSend_internalCommandQueue(v465, v110, v111, v109);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v112, v113, v114);
  v430 = (void *)objc_claimAutoreleasedReturnValue();

  v115 = objc_alloc(MEMORY[0x24BDBF680]);
  objc_msgSend_metalTexture(v467, v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v443 = (void *)objc_msgSend_initWithMTLTexture_commandBuffer_(v115, v119, (uint64_t)v118, v430);

  objc_msgSend_setFlipped_(v443, v120, 1);
  objc_msgSend_setColorSpace_(v443, v121, 0);
  objc_msgSend_componentAdd(MEMORY[0x24BDBF630], v122, v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBlendKernel_(v443, v125, (uint64_t)v124);

  objc_msgSend_setBlendsInDestinationColorSpace_(v443, v126, 1);
  v128 = (id)objc_msgSend_startTaskToClear_error_(v465, v127, (uint64_t)v443, 0);
  objc_msgSend_commit(v430, v129, v130);
  CFAbsoluteTimeGetCurrent();
  v133 = v463;
  v134 = v463 - 1;
  v135 = v463 - 1 + v19;
  if (v463 <= v135)
  {
    v448 = 0;
    v431 = 0;
    v424 = v134 + v14;
    v138 = (v134 + v14) / v463;
    v422 = v138;
    if (v138 <= 1)
      v138 = 1;
    v459 = v138;
    v139 = v135 / v463;
    if (v139 <= 1)
      v139 = 1;
    v423 = v139;
    v434 = *MEMORY[0x24BDBF8F8];
    v433 = *MEMORY[0x24BDBF9C0];
    v432 = *MEMORY[0x24BDBF8D0];
    v429 = v39;
    while (v133 > v424)
    {
LABEL_86:
      ++v431;
      v133 = v463;
      if (v431 == v423)
        goto LABEL_6;
    }
    v469 = 0;
    v460 = (double)(v431 * v133);
    r2 = v460 - v454;
    while (1)
    {
      objc_msgSend_region(v467, v131, v132);
      v514.origin.x = v140;
      v514.origin.y = v141;
      v514.size.width = v142;
      v514.size.height = v143;
      v144 = (double)(v469 * v463);
      v508.origin.x = v144;
      v508.size.width = (double)v463;
      v508.origin.y = v460;
      v508.size.height = (double)v463;
      if (CGRectIntersectsRect(v508, v514))
        break;
LABEL_85:
      if (++v469 == v459)
        goto LABEL_86;
    }
    CFAbsoluteTimeGetCurrent();
    v145 = v144 - v454;
    sub_24B6CECB0(v453, v146, v147, v144 - v454, r2, v107, v107);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6CECB0(v452, v149, v150, v144 - v454, r2, v107, v107);
    v464 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6CECB0(v451, v151, v152, v144 - v454, r2, v107, v107);
    v462 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6CECB0(v450, v153, v154, v144 - v454, r2, v107, v107);
    v466 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v466, v155, v156);
    v158 = v157;
    v160 = v159;
    v162 = v161;
    v164 = v163;
    v496[0] = v466;
    v496[1] = v464;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v165, (uint64_t)v496, 2);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v449, v167, (uint64_t)v166, v158, v160, v162, v164);
    v168 = (void *)objc_claimAutoreleasedReturnValue();

    CFAbsoluteTimeGetCurrent();
    v169 = CFAbsoluteTimeGetCurrent();
    objc_msgSend_region(v461, v170, v171, v169);
    v515.origin.x = v145;
    v515.origin.y = v460 - v454;
    v515.size.width = v107;
    v515.size.height = v107;
    v510 = CGRectIntersection(v509, v515);
    x = v510.origin.x;
    y = v510.origin.y;
    width = v510.size.width;
    height = v510.size.height;
    v176 = objc_retainAutorelease(v461);
    v179 = objc_msgSend_baseAddress(v176, v177, v178);
    v182 = objc_msgSend_bytesPerRow(v176, v180, v181);
    objc_msgSend_region(v176, v183, v184);
    v186 = v185;
    objc_msgSend_region(v176, v187, v188);
    v190 = v189;
    objc_msgSend_region(v176, v191, v192);
    v194 = (uint64_t)height;
    if ((uint64_t)height < 1)
    {
      v200 = 0;
    }
    else
    {
      v195 = 0;
      v196 = v179 + (uint64_t)x - (uint64_t)v186 + ((uint64_t)v190 - v194 - (uint64_t)(y - v193)) * v182;
      v197 = (uint64_t)width;
      do
      {
        if ((int)v197 < 1)
        {
          v200 = 0;
        }
        else
        {
          v198 = 0;
          v199 = 0;
          do
          {
            v199 |= ~*(_DWORD *)(v196 + v198);
            v198 += 4;
          }
          while ((int)v198 < (int)v197);
          v200 = v199 != 0;
        }
        if (++v195 >= v194)
          break;
        v196 += v182;
      }
      while (!v200);
    }
    v203 = CFAbsoluteTimeGetCurrent();
    v204 = ((_BYTE)v469 + (_BYTE)v431 * v422) & 1;
    v205 = v502[v204];
    v206 = v501[v204];
    v207 = v500[v204];
    v208 = v498[v204];
    if (v205)
      v209 = v206 == 0;
    else
      v209 = 1;
    v210 = v209 || v207 == 0;
    v456 = v499[v204];
    v211 = v210 || v499[v204] == 0;
    v212 = !v211;
    if (v211)
    {
      uni_logger_api();
      v213 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v213, OS_LOG_TYPE_ERROR))
        sub_24B6EF68C(v494, &v495, v213);

    }
    if (!v208)
    {
      uni_logger_api();
      v214 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
        sub_24B6EF64C(v492, &v493, v214);

    }
    if (v208)
      v215 = v212;
    else
      v215 = 0;
    objc_msgSend_region(v467, v201, v202, v203);
    objc_msgSend_region(v467, v216, v217);
    if ((v215 & v200 & 1) == 0)
    {
      v247 = v466;
LABEL_84:
      v374 = CFAbsoluteTimeGetCurrent();
      objc_msgSend_extent(v247, v375, v376, v374);
      v378 = v377;
      v380 = v379;
      v382 = v381;
      v384 = v383;
      v474[0] = v247;
      v474[1] = v446;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v385, (uint64_t)v474, 2);
      v386 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_arguments_(v447, v387, (uint64_t)v386, v378, v380, v382, v384);
      v388 = (void *)objc_claimAutoreleasedReturnValue();

      CFAbsoluteTimeGetCurrent();
      v389 = CFAbsoluteTimeGetCurrent();
      objc_msgSend_internalCommandQueue(v465, v390, v391, v389);
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_commandBuffer(v392, v393, v394);
      v395 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_metalTexture(v467, v396, v397);
      v398 = (void *)objc_claimAutoreleasedReturnValue();
      v399 = v465;
      v400 = v388;
      v401 = (objc_class *)MEMORY[0x24BDBF680];
      v402 = v395;
      v403 = [v401 alloc];
      v405 = (void *)objc_msgSend_initWithMTLTexture_commandBuffer_(v403, v404, (uint64_t)v398, v402);

      objc_msgSend_setFlipped_(v405, v406, 1);
      objc_msgSend_setColorSpace_(v405, v407, 0);
      objc_msgSend_componentAdd(MEMORY[0x24BDBF630], v408, v409);
      v410 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBlendKernel_(v405, v411, (uint64_t)v410);

      objc_msgSend_setBlendsInDestinationColorSpace_(v405, v412, 1);
      objc_msgSend_extent(v400, v413, v414);
      v416 = (id)objc_msgSend_startTaskToRender_fromRect_toDestination_atPoint_error_(v399, v415, (uint64_t)v400, v405, 0);

      objc_msgSend_commit(v402, v417, v418);
      CFAbsoluteTimeGetCurrent();

      goto LABEL_85;
    }
    CFAbsoluteTimeGetCurrent();
    sub_24B6CEF78(v148);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6CED4C(v218);
    v455 = (void *)objc_claimAutoreleasedReturnValue();

    sub_24B6CEF78(v168);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6CED4C(v219);
    v458 = (void *)objc_claimAutoreleasedReturnValue();

    CFAbsoluteTimeGetCurrent();
    v220 = CFAbsoluteTimeGetCurrent();
    objc_msgSend_internalCommandQueue(v465, v221, v222, v220);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_commandBuffer(v223, v224, v225);
    v226 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectAtIndexedSubscript_(v442, v227, v204);
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6CF070(v465, v455, v228, v226);

    objc_msgSend_objectAtIndexedSubscript_(v441, v229, v204);
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6CF070(v465, v458, v230, v226);

    objc_msgSend_objectAtIndexedSubscript_(v440, v231, v204);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6CF070(v465, v464, v232, v226);

    objc_msgSend_objectAtIndexedSubscript_(v439, v233, v204);
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6CF070(v465, v462, v234, v226);

    objc_msgSend_commit(v226, v235, v236);
    objc_msgSend_waitUntilScheduled(v226, v237, v238);
    CFAbsoluteTimeGetCurrent();
    CFAbsoluteTimeGetCurrent();
    v239 = v438;
    objc_sync_enter(v239);
    v242 = objc_msgSend_buildWait(v239, v240, v241);
    CFAbsoluteTimeGetCurrent();
    if ((v242 & 1) != 0)
    {
      v243 = CFAbsoluteTimeGetCurrent();
      v448 = objc_msgSend_bind_buffer_(v239, v244, (uint64_t)"input_ref", v205, v243);
      if (v448)
      {
        uni_logger_api();
        v246 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
          sub_24B6EF5CC(v488, &v489, v246);
LABEL_73:

LABEL_74:
        objc_sync_exit(v239);

        CFAbsoluteTimeGetCurrent();
        v253 = CFAbsoluteTimeGetCurrent();
        v254 = (void *)MEMORY[0x24BDBF660];
        objc_msgSend_objectAtIndexedSubscript_(v437, v255, v204, v253);
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        v478 = v434;
        v479 = MEMORY[0x24BDBD1C8];
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v257, (uint64_t)&v479, &v478, 1);
        v258 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageWithMTLTexture_options_(v254, v259, (uint64_t)v256, v258);
        v457 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_extent(v457, v260, v261);
        v263 = v262;
        v265 = v264;
        v267 = v266;
        v269 = v268;
        v477[0] = v458;
        v477[1] = v457;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v270, (uint64_t)v477, 2);
        v271 = (void *)objc_claimAutoreleasedReturnValue();
        v475 = v433;
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v272, v432);
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        v476 = v273;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v274, (uint64_t)&v476, &v475, 1);
        v275 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_applyWithExtent_arguments_options_(v436, v276, (uint64_t)v271, v275, v263, v265, v267, v269);
        v277 = (void *)objc_claimAutoreleasedReturnValue();

        v278 = v277;
        objc_msgSend_kernelWithName_(CoreImageOnlyLibrary, v279, (uint64_t)CFSTR("ccp_planarToInterleaved"));
        v282 = (void *)objc_claimAutoreleasedReturnValue();
        if (v278)
        {
          objc_msgSend_extent(v278, v280, v281);
          if (CGRectIsInfinite(v511))
          {
            v285 = 0;
            v286 = v278;
          }
          else
          {
            objc_msgSend_extent(v278, v283, v284);
            v288 = v287;
            objc_msgSend_extent(v278, v289, v290);
            v292 = v291;
            v294 = v293;
            v296 = v295;
            v298 = v297;
            CGAffineTransformMakeScale(&v506, 1.0, 0.333333333);
            v512.origin.x = v292;
            v512.origin.y = v294;
            v512.size.width = v296;
            v512.size.height = v298;
            v513 = CGRectApplyAffineTransform(v512, &v506);
            v299 = v513.origin.x;
            v300 = v513.origin.y;
            v301 = v513.size.width;
            v302 = v513.size.height;
            v473[0] = MEMORY[0x24BDAC760];
            v473[1] = 3221225472;
            v473[2] = sub_24B6CFAF8;
            v473[3] = &unk_251C8F8D0;
            v473[4] = v288;
            v505[0] = v278;
            objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v303, v304, v513.size.height);
            v305 = (void *)objc_claimAutoreleasedReturnValue();
            v505[1] = v305;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v306, (uint64_t)v505, 2);
            v307 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_applyWithExtent_roiCallback_arguments_(v282, v308, (uint64_t)v473, v307, v299, v300, v301, v302);
            v309 = (void *)objc_claimAutoreleasedReturnValue();

            v286 = v309;
            v285 = v286;
          }
        }
        else
        {
          v286 = 0;
          v285 = 0;
        }

        v310 = v285;
        objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v311, (uint64_t)CFSTR("from_range_m1_p1"));
        v312 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extent(v310, v313, v314);
        v316 = v315;
        v318 = v317;
        v320 = v319;
        v322 = v321;
        *(_QWORD *)&v506.a = v310;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v323, (uint64_t)&v506, 1);
        v324 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_applyWithExtent_arguments_(v312, v325, (uint64_t)v324, v316, v318, v320, v322);
        v326 = (void *)objc_claimAutoreleasedReturnValue();

        v327 = v326;
        v329 = v466;
        if (v444 >= 1.0)
        {
          v247 = v327;
        }
        else
        {
          objc_msgSend_imageYCC444_matrix_fullRange_precision_colorSpace_(MEMORY[0x24BDBF660], v328, (uint64_t)v329, 709, 1, 0, 0);
          v330 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_imageYCC444_matrix_fullRange_precision_colorSpace_(MEMORY[0x24BDBF660], v331, (uint64_t)v327, 709, 1, 0, 0);
          v332 = (void *)objc_claimAutoreleasedReturnValue();
          v333 = v330;
          objc_msgSend_extent(v333, v334, v335);
          v337 = v336;
          v339 = v338;
          v341 = v340;
          v343 = v342;
          objc_msgSend_imageByClampingToExtent(v333, v344, v345);
          v346 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_imageByApplyingGaussianBlurWithSigma_(v346, v347, v348, v429);
          v349 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_imageByCroppingToRect_(v349, v350, v351, v337, v339, v341, v343);
          v352 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v352)
            sub_24B6EF42C();
          objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v353, (uint64_t)CFSTR("blend_chroma"));
          v354 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setPerservesAlpha_(v354, v355, 1);
          objc_msgSend_extent(v332, v356, v357);
          v359 = v358;
          v361 = v360;
          v363 = v362;
          v365 = v364;
          *(_QWORD *)&v506.a = v332;
          *(_QWORD *)&v506.b = v352;
          *(float *)&v358 = v444;
          objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v366, v367, v358);
          v368 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v506.c = v368;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v369, (uint64_t)&v506, 3);
          v370 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_applyWithExtent_arguments_(v354, v371, (uint64_t)v370, v359, v361, v363, v365);
          v372 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_imageWithYCCImage_matrix_fullRange_precision_colorSpace_(MEMORY[0x24BDBF660], v373, (uint64_t)v372, 709, 1, 0, 0);
          v247 = (id)objc_claimAutoreleasedReturnValue();

        }
        CFAbsoluteTimeGetCurrent();

        v168 = v458;
        v148 = v455;
        goto LABEL_84;
      }
      v448 = objc_msgSend_bind_buffer_(v239, v245, (uint64_t)"input_corrupted", v206);
      if (v448)
      {
        uni_logger_api();
        v246 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
          sub_24B6EF58C(v486, &v487, v246);
        goto LABEL_73;
      }
      v448 = objc_msgSend_bind_buffer_(v239, v250, (uint64_t)"input_mask", v207);
      if (v448)
      {
        uni_logger_api();
        v246 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
          sub_24B6EF54C(v484, &v485, v246);
        goto LABEL_73;
      }
      v448 = objc_msgSend_bind_buffer_(v239, v251, (uint64_t)"input_alpha", v456);
      if (v448)
      {
        uni_logger_api();
        v246 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
          sub_24B6EF50C(v482, &v483, v246);
        goto LABEL_73;
      }
      v448 = objc_msgSend_bind_buffer_(v239, v252, (uint64_t)"output_residual", v208);
      if (v448)
      {
        uni_logger_api();
        v246 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
          sub_24B6EF4CC(v480, &v481, v246);
        goto LABEL_73;
      }
    }
    else
    {
      uni_logger_api();
      v248 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR))
        sub_24B6EF60C(v490, &v491, v248);

      if (v448)
        goto LABEL_74;
    }
    v471[0] = MEMORY[0x24BDAC760];
    v471[1] = 3221225472;
    v471[2] = sub_24B6CF254;
    v471[3] = &unk_251C8F8B0;
    v472 = v467;
    if (objc_msgSend_executeAsync_(v239, v249, (uint64_t)v471))
    {
      uni_logger_api();
      v419 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v419, OS_LOG_TYPE_ERROR))
        sub_24B6EF454(v419, v420, v421);

      __assert_rtn("+[ApplyHairnetModel processWithInputs:arguments:output:error:]", "HairnetProcessor.m", 536, "status==0");
    }
    v448 = 0;
    v246 = v472;
    goto LABEL_73;
  }
LABEL_6:
  dispatch_get_global_queue(-32768, 0);
  v136 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_24B6CF2DC;
  block[3] = &unk_251C8F0C0;
  block[4] = v465;
  dispatch_async(v136, block);

  return 1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  int *v3;
  int *v4;

  v3 = (int *)MEMORY[0x24BDBF890];
  v4 = (int *)MEMORY[0x24BDBF8C0];
  if (a3 >= 2)
    v4 = (int *)MEMORY[0x24BDBF8D0];
  if (a3 != 2)
    v3 = v4;
  return *v3;
}

+ (int)outputFormat
{
  return *MEMORY[0x24BDBF8C0];
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v32;
  unint64_t v33;
  double v34;
  double v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect result;
  CGRect v57;
  CGRect v58;

  v5 = a4;
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("fullWidth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_unsignedLongValue(v7, v8, v9);

  objc_msgSend_objectForKeyedSubscript_(v5, v11, (uint64_t)CFSTR("fullHeight"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_unsignedLongValue(v12, v13, v14);

  objc_msgSend_objectForKeyedSubscript_(v5, v16, (uint64_t)CFSTR("tileSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_unsignedLongValue(v17, v18, v19);

  objc_msgSend_objectForKeyedSubscript_(v5, v21, (uint64_t)CFSTR("tileOverlap"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_unsignedLongValue(v22, v23, v24);

  v26 = v20 - 1;
  v27 = v20 - 1 + v15;
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  if (v20 <= v27)
  {
    v32 = 0;
    v33 = v26 + v10;
    v34 = (double)(unint64_t)v25;
    v35 = (double)(v20 + 2 * v25);
    v36 = (v26 + v10) / v20;
    if (v36 <= 1)
      v37 = 1;
    else
      v37 = v36;
    v38 = v27 / v20;
    if (v38 <= 1)
      v39 = 1;
    else
      v39 = v38;
    do
    {
      if (v20 <= v33)
      {
        v40 = 0;
        v41 = v37;
        do
        {
          v51.origin.x = (double)v40 - v34;
          v51.origin.y = (double)(v32 * v20) - v34;
          v51.size.width = v35;
          v51.size.height = v35;
          if (CGRectIntersectsRect(v51, a5))
          {
            v52.origin.x = x;
            v52.origin.y = y;
            v52.size.width = width;
            v52.size.height = height;
            v57.origin.x = (double)v40 - v34;
            v57.origin.y = (double)(v32 * v20) - v34;
            v57.size.width = v35;
            v57.size.height = v35;
            v53 = CGRectUnion(v52, v57);
            x = v53.origin.x;
            y = v53.origin.y;
            width = v53.size.width;
            height = v53.size.height;
          }
          v40 += v20;
          --v41;
        }
        while (v41);
      }
      ++v32;
    }
    while (v32 != v39);
  }
  v58.size.width = (double)(unint64_t)v10;
  v58.size.height = (double)(unint64_t)v15;
  v58.origin.x = 0.0;
  v58.origin.y = 0.0;
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  v55 = CGRectIntersection(v54, v58);
  v42 = v55.origin.x;
  v43 = v55.origin.y;
  v44 = v55.size.width;
  v45 = v55.size.height;

  v46 = v42;
  v47 = v43;
  v48 = v44;
  v49 = v45;
  result.size.height = v49;
  result.size.width = v48;
  result.origin.y = v47;
  result.origin.x = v46;
  return result;
}

+ (id)apply:(id)a3 sdof:(id)a4 mask:(id)a5 alpha:(id)a6 chromaWeight:(float)a7 chromaBlurSigma:(float)a8 model:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  double v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  double v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  void *v61;
  double v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  double v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  const char *v83;
  void *v84;
  const char *v85;
  void *v86;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  _QWORD v92[4];
  _QWORD v93[7];
  _QWORD v94[7];
  uint64_t v95;
  void *v96;
  _QWORD v97[3];

  v97[1] = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = v18;
  if (!v21)
    sub_24B6EF76C();
  v23 = v21;
  objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v22, (uint64_t)CFSTR("invertMask"));
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
    sub_24B6EF794();
  v27 = (void *)v24;
  v89 = v19;
  v90 = a1;
  objc_msgSend_extent(v23, v25, v26);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v97[0] = v23;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v36, (uint64_t)v97, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = *MEMORY[0x24BDBF9C0];
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v38, *MEMORY[0x24BDBF8D0]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v39;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v40, (uint64_t)&v96, &v95, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyWithExtent_arguments_options_(v27, v42, (uint64_t)v37, v41, v29, v31, v33, v35);
  v43 = objc_claimAutoreleasedReturnValue();

  v88 = (void *)v43;
  if (!v43)
    sub_24B6EF7BC();

  v93[0] = CFSTR("fullWidth");
  v44 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_extent(v16, v45, v46);
  objc_msgSend_numberWithDouble_(v44, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v50;
  v93[1] = CFSTR("fullHeight");
  v51 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_extent(v16, v52, v53);
  objc_msgSend_numberWithDouble_(v51, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = v57;
  v93[2] = CFSTR("tileSize");
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v58, 336);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v94[2] = v59;
  v93[3] = CFSTR("tileOverlap");
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v60, 24);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v94[3] = v61;
  v93[4] = CFSTR("chromaWeight");
  *(float *)&v62 = a7;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v63, v64, v62);
  v65 = v17;
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v94[4] = v66;
  v93[5] = CFSTR("chromaBlurSigma");
  *(float *)&v67 = a8;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v68, v69, v67);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v93[6] = CFSTR("model");
  v94[5] = v70;
  v94[6] = v20;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v71, (uint64_t)v94, v93, 7);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_extent(v16, v73, v74);
  v76 = v75;
  v78 = v77;
  v80 = v79;
  v82 = v81;
  v92[0] = v16;
  v92[1] = v65;
  v92[2] = v88;
  v92[3] = v89;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v83, (uint64_t)v92, 4);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0;
  objc_msgSend_applyWithExtent_inputs_arguments_error_(v90, v85, (uint64_t)v84, v72, &v91, v76, v78, v80, v82);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  return v86;
}

@end
