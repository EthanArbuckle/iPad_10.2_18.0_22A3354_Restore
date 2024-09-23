@implementation SPTextualReportParser

+ (BOOL)isSpindumpFile:(const char *)a3
{
  FILE *v4;
  FILE *v5;
  char *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  int *v13;
  char *v14;
  const __CFString *v15;
  const __CFString *v16;
  const char *CStringPtr;
  char *v18;
  char *v19;
  NSObject *v20;
  FILE *v21;
  FILE *v22;

  v4 = fopen(a3, "r");
  if (v4)
  {
    v5 = v4;
    v6 = (char *)malloc_type_malloc(0x4000uLL, 0x342C76BFuLL);
    while (fgets(v6, 0x4000, v5))
    {
      if (!strncmp("Report Version:", v6, 0xFuLL))
      {
        v7 = strtol(v6 + 15, 0, 0) != 0;
        goto LABEL_16;
      }
    }
    v7 = 0;
LABEL_16:
    free(v6);
    fclose(v5);
  }
  else
  {
    if (byte_1000EBD38)
    {
      v8 = *__error();
      v9 = sub_100030318();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100097828();
      *__error() = v8;
    }
    if (byte_1000EBD39)
      v10 = dword_1000EB4E8 <= 3;
    else
      v10 = 0;
    if (v10)
    {
      v11 = *__error();
      v12 = *__error();
      v13 = __error();
      v14 = strerror(*v13);
      v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Unable to open %s: %d (%s)"), a3, v12, v14);
      if (v15)
      {
        v16 = v15;
        CStringPtr = CFStringGetCStringPtr(v15, 0x8000100u);
        if (CStringPtr)
        {
          v18 = (char *)CStringPtr;
          v19 = 0;
        }
        else
        {
          v18 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x59BEC203uLL);
          CFStringGetCString(v16, v18, 1024, 0x8000100u);
          v19 = v18;
        }
        if (qword_1000EBD40)
          v22 = (FILE *)qword_1000EBD40;
        else
          v22 = __stderrp;
        fprintf(v22, "%s\n", v18);
        if (v19)
          free(v19);
        CFRelease(v16);
      }
      else
      {
        v20 = sub_100030318();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          sub_1000977A8();
        if (qword_1000EBD40)
          v21 = (FILE *)qword_1000EBD40;
        else
          v21 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v21);
      }
      v7 = 0;
      *__error() = v11;
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

- (BOOL)parseSpindumpFile:(const char *)a3 andReportToStream:(__sFILE *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FILE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  int *v20;
  char v21;
  char *v22;
  int v23;
  uint64_t v24;
  int *v25;
  char *v26;
  const __CFString *v27;
  const __CFString *v28;
  char *v29;
  char *v30;
  int v31;
  NSObject *v32;
  BOOL v33;
  const __CFString *v34;
  char *v35;
  char *v36;
  int v37;
  NSObject *v38;
  BOOL v39;
  uint64_t v40;
  int *v41;
  char *v42;
  const __CFString *v43;
  const __CFString *v44;
  char *CStringPtr;
  char *v46;
  NSObject *v47;
  FILE *v48;
  int v49;
  NSObject *v50;
  const __CFString *v51;
  char *v52;
  char *v53;
  NSObject *v54;
  FILE *v55;
  FILE *v56;
  int v57;
  NSObject *v58;
  int v59;
  const __CFString *v60;
  const __CFString *v61;
  char *v62;
  char *v63;
  FILE *v64;
  int *v65;
  __CFString *v66;
  id v67;
  __CFString *v68;
  id v69;
  __CFString *v70;
  id v71;
  id v72;
  int v73;
  NSObject *v74;
  int *v75;
  int v76;
  NSObject *v77;
  int v78;
  const __CFString *v79;
  const __CFString *v80;
  char *v81;
  char *v82;
  FILE *v83;
  int v84;
  int *v85;
  char *v86;
  NSObject *v87;
  FILE *v88;
  NSObject *v89;
  FILE *v90;
  FILE *v91;
  int v92;
  int *v93;
  char *v94;
  NSObject *v95;
  FILE *v96;
  FILE *v97;
  int v98;
  NSObject *v99;
  int v100;
  const __CFString *v101;
  const __CFString *v102;
  char *v103;
  char *v104;
  NSObject *v105;
  FILE *v106;
  FILE *v107;
  int v108;
  NSObject *v109;
  const __CFString *v110;
  const __CFString *v111;
  char *v112;
  char *v113;
  int startIndex;
  int v115;
  NSObject *v116;
  const __CFString *v117;
  char *v118;
  char *v119;
  int v120;
  NSObject *v121;
  int v122;
  const __CFString *v123;
  const __CFString *v124;
  char *v125;
  char *v126;
  NSObject *v127;
  FILE *v128;
  FILE *v129;
  NSObject *v130;
  NSObject *v131;
  FILE *v132;
  FILE *v133;
  FILE *v134;
  int v135;
  NSObject *v136;
  int v137;
  const __CFString *v138;
  const __CFString *v139;
  char *v140;
  char *v141;
  NSObject *v142;
  FILE *v143;
  FILE *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
  NSString *v154;
  id v155;
  unint64_t v156;
  id v157;
  unint64_t v158;
  unint64_t v159;
  uint64_t v160;
  int v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  int v167;
  int v168;
  int v169;
  int endIndex;
  int v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  NSString *v175;
  uint64_t v176;
  id v177;
  uint64_t v178;
  id v179;
  int v180;
  uint64_t v181;
  unint64_t v182;
  int v183;
  void *v184;
  uint64_t v185;
  id v186;
  int v187;
  NSString *v188;
  unint64_t v189;
  int v190;
  uint64_t v191;
  id v192;
  uint64_t v193;
  id v194;
  uint64_t v195;
  id v196;
  uint64_t v197;
  id v198;
  id v199;
  void *v200;
  uint64_t v201;
  id v202;
  uint64_t v203;
  int v204;
  NSObject *v205;
  const __CFString *v206;
  const __CFString *v207;
  char *v208;
  char *v209;
  id v210;
  NSString *v211;
  int v212;
  int v213;
  int v214;
  int v215;
  NSObject *v216;
  int v217;
  const __CFString *v218;
  const __CFString *v219;
  char *v220;
  char *v221;
  int v222;
  BOOL v223;
  char v224;
  int v225;
  unsigned int v226;
  uint64_t v227;
  unsigned int *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  unsigned int v232;
  unsigned int v233;
  int v234;
  NSObject *v235;
  const __CFString *v236;
  const __CFString *v237;
  char *v238;
  char *v239;
  NSString *v240;
  int v241;
  NSObject *v242;
  NSString *v243;
  int v244;
  const __CFString *v245;
  const __CFString *v246;
  char *v247;
  char *v248;
  unsigned int v249;
  int v250;
  id v251;
  uint64_t v252;
  uint64_t v253;
  NSObject *v254;
  FILE *v255;
  NSString *v256;
  char *v257;
  uint64_t v258;
  unsigned int v259;
  int v260;
  int v261;
  int v262;
  int v263;
  _BOOL4 v264;
  const char *v265;
  id v266;
  unint64_t v267;
  int v268;
  unint64_t v269;
  id v270;
  int v271;
  int v272;
  const char *v273;
  const char *v274;
  int v275;
  unsigned int v276;
  int v277;
  FILE *v278;
  NSObject *v279;
  FILE *v280;
  NSString *v281;
  int v282;
  NSObject *v283;
  NSString *v284;
  int v285;
  const __CFString *v286;
  const __CFString *v287;
  char *v288;
  char *v289;
  unint64_t v290;
  _QWORD *v291;
  void *v292;
  FILE *v293;
  id v294;
  uint64_t v295;
  void *i;
  uint64_t v297;
  NSString *v298;
  int v299;
  NSObject *v300;
  NSString *v301;
  int v302;
  const __CFString *v303;
  const __CFString *v304;
  char *v305;
  char *v306;
  NSObject *v307;
  FILE *v308;
  FILE *v309;
  uint64_t v310;
  id v311;
  _DWORD *v312;
  int v313;
  SPTextualReportParser *v314;
  void *v315;
  id v316;
  id v317;
  unsigned int v318;
  int omitFramesBelowSampleCount;
  int v320;
  uint64_t v321;
  unsigned int *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  unsigned int v326;
  unsigned int v327;
  void *v328;
  unint64_t v329;
  id v330;
  void *v331;
  id v332;
  unsigned int v333;
  int v334;
  void *v335;
  void *v336;
  NSString *v337;
  int v338;
  NSObject *v339;
  NSString *v340;
  int v341;
  const __CFString *v342;
  const __CFString *v343;
  char *v344;
  char *v345;
  NSObject *v346;
  FILE *v347;
  NSObject *v348;
  FILE *v349;
  NSObject *v350;
  FILE *v351;
  FILE *v352;
  NSObject *v353;
  FILE *v354;
  FILE *v355;
  FILE *v356;
  uint64_t v357;
  signed int v358;
  id v359;
  uint64_t v360;
  void *v361;
  uint64_t v362;
  id v363;
  id v364;
  int v365;
  id v366;
  id v367;
  void *v368;
  void *v369;
  signed int v370;
  id v371;
  uint64_t v372;
  uint64_t v373;
  char v374;
  uint64_t v375;
  uint64_t v376;
  id v377;
  id v378;
  void *v379;
  const char *v380;
  void *v381;
  const char *v382;
  void *v383;
  const char *v384;
  const char *v385;
  FILE *v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  int v393;
  FILE *v394;
  id v395;
  id v396;
  int v397;
  NSObject *v398;
  const __CFString *v399;
  char *v400;
  char *v401;
  NSObject *v402;
  FILE *v403;
  void *v404;
  int v406;
  id v407;
  const __CFString *v408;
  const __CFString *v409;
  NSObject *v410;
  FILE *v411;
  int v412;
  const __CFString *v413;
  const __CFString *v414;
  NSObject *v415;
  FILE *v416;
  int v417;
  const __CFString *v418;
  const __CFString *v419;
  NSObject *v420;
  FILE *v421;
  int v422;
  const __CFString *v423;
  const __CFString *v424;
  NSObject *v425;
  FILE *v426;
  int v427;
  NSObject *v428;
  id v429;
  const char *v430;
  int v431;
  const __CFString *v432;
  const __CFString *v433;
  NSObject *v434;
  id v435;
  const char *v436;
  FILE *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  int v442;
  NSObject *v443;
  const char *v444;
  BOOL v445;
  int v446;
  const __CFString *v447;
  const __CFString *v448;
  NSObject *v449;
  const char *v450;
  FILE *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  int v456;
  NSObject *v457;
  int v458;
  NSObject *v459;
  int v460;
  NSObject *v461;
  int v462;
  NSObject *v463;
  int v464;
  const __CFString *v465;
  const __CFString *v466;
  NSObject *v467;
  FILE *v468;
  int v469;
  NSObject *v470;
  int v471;
  const __CFString *v472;
  const __CFString *v473;
  NSObject *v474;
  FILE *v475;
  int v476;
  NSObject *v477;
  unsigned int v478;
  const char *v479;
  BOOL v480;
  int v481;
  unsigned int v482;
  const __CFString *v483;
  const __CFString *v484;
  NSObject *v485;
  const char *v486;
  FILE *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  int v492;
  const __CFString *v493;
  const __CFString *v494;
  NSObject *v495;
  FILE *v496;
  NSString *v497;
  int v498;
  const __CFString *v499;
  const __CFString *v500;
  NSObject *v501;
  FILE *v502;
  int v503;
  NSObject *v504;
  int v505;
  NSObject *v506;
  int v507;
  NSObject *v508;
  int v509;
  NSObject *v510;
  const char *v511;
  int v512;
  const __CFString *v513;
  const __CFString *v514;
  NSObject *v515;
  const char *v516;
  FILE *v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  char *v522;
  char *v523;
  char *v524;
  char *v525;
  char *v526;
  char *v527;
  int v528;
  NSObject *v529;
  const char *v530;
  BOOL v531;
  int v532;
  const __CFString *v533;
  const __CFString *v534;
  NSObject *v535;
  const char *v536;
  FILE *v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  char *v542;
  char *v543;
  char *v544;
  char *v545;
  FILE *v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  int v551;
  const char *v552;
  FILE *v553;
  FILE *v554;
  char *v555;
  char *v556;
  char *v557;
  char *v558;
  char *v559;
  char *v560;
  FILE *v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  const char *v566;
  int v567;
  FILE *v568;
  FILE *v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  FILE *v574;
  BOOL v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  FILE *v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  int v585;
  NSObject *v586;
  int v587;
  const __CFString *v588;
  const __CFString *v589;
  NSObject *v590;
  FILE *v591;
  char *v592;
  char *v593;
  char *v594;
  char *v595;
  char *v596;
  char *v597;
  FILE *v598;
  char *v599;
  char *v600;
  FILE *v601;
  FILE *v602;
  FILE *v603;
  char *v604;
  char *v605;
  char *v606;
  char *v607;
  FILE *v608;
  FILE *v609;
  char v610;
  id v611;
  id v612;
  int v613;
  int v614;
  NSString *v615;
  uint64_t v616;
  void *v617;
  id v618;
  int v619;
  unsigned int v620;
  id v621;
  uint64_t v622;
  uint64_t v623;
  unint64_t v624;
  uint64_t v625;
  uint64_t v626;
  unint64_t v627;
  void *v628;
  int v629;
  NSString *v630;
  NSString *v631;
  NSString *v632;
  const char *v633;
  id v634;
  int v635;
  id *v636;
  const char *v637;
  BOOL v638;
  int v639;
  uint64_t v640;
  const char *v641;
  uint64_t v642;
  id v643;
  void *context;
  __sFILE *v645;
  id *Weak;
  int v647;
  id v648;
  id v649;
  int v650;
  int v651;
  int v652;
  id v653;
  int v654;
  id obj;
  id v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  __int128 v664;
  __int128 v665;
  __int128 v666;
  __int128 v667;
  __int128 v668;
  __int128 v669;
  uint64_t v670;
  id v671;
  int v672;
  int v673;
  BOOL v674;
  int v675;
  unsigned int v676;
  __int128 v677;
  __int128 v678;
  __int128 v679;
  __int128 v680;
  int v681;
  int v682;
  unsigned __int8 v683;
  _QWORD v684[2];
  void (*v685)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v686;
  uint64_t *v687;
  uint64_t *v688;
  uint64_t v689;
  uint64_t *v690;
  uint64_t v691;
  int v692;
  uint64_t v693;
  uint64_t *v694;
  uint64_t v695;
  uint64_t v696;
  id v697;
  _BYTE v698[128];
  _BYTE v699[128];
  _BYTE v700[128];
  _BYTE v701[128];
  _DWORD v702[8];
  _BYTE buf[56];
  int *v704;
  NSString *v705;
  id *v706;
  unsigned int *v707;
  id v708;
  uint64_t v709;
  int v710;
  int v711;
  int v712;
  char v713;
  BOOL v714;

  v6 = objc_autoreleasePoolPush();
  v693 = 0;
  v694 = &v693;
  v695 = 0x2020000000;
  v696 = 0;
  v689 = 0;
  v690 = &v689;
  v691 = 0x2020000000;
  v692 = 0;
  v14 = fopen(a3, "r");
  if (!v14)
  {
    if (byte_1000EBD38)
    {
      v37 = *__error();
      v38 = sub_100030318();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v84 = *__error();
        v85 = __error();
        v86 = strerror(*v85);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = a3;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v84;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = v86;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Parsing spindump text: Unable to open %s: %d (%s)", buf, 0x1Cu);
      }
      *__error() = v37;
    }
    if (byte_1000EBD39)
      v39 = dword_1000EB4E8 <= 3;
    else
      v39 = 0;
    if (v39)
    {
      v23 = *__error();
      v40 = *__error();
      v41 = __error();
      v42 = strerror(*v41);
      v43 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Unable to open %s: %d (%s)"), a3, v40, v42);
      v44 = v43;
      if (v43)
      {
        CStringPtr = (char *)CFStringGetCStringPtr(v43, 0x8000100u);
        if (CStringPtr)
        {
          v46 = 0;
        }
        else
        {
          CStringPtr = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x8BE9E530uLL);
          CFStringGetCString(v44, CStringPtr, 1024, 0x8000100u);
          v46 = CStringPtr;
        }
        if (qword_1000EBD40)
          v64 = (FILE *)qword_1000EBD40;
        else
          v64 = __stderrp;
        fprintf(v64, "%s\n", CStringPtr);
        if (v46)
          free(v46);
        CFRelease(v44);
      }
      else
      {
        v54 = sub_100030318();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
        {
          v92 = *__error();
          v93 = __error();
          v94 = strerror(*v93);
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = a3;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v92;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = v94;
          _os_log_fault_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Unable to open %s: %d (%s)", buf, 0x1Cu);
        }
        if (qword_1000EBD40)
          v55 = (FILE *)qword_1000EBD40;
        else
          v55 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v55);
      }
      v65 = __error();
      goto LABEL_806;
    }
LABEL_39:
    v22 = 0;
    obj = 0;
    v657 = 0;
LABEL_40:
    v21 = 0;
    goto LABEL_807;
  }
  v684[0] = _NSConcreteStackBlock;
  v684[1] = 3221225472;
  v685 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10007CE38;
  v686 = &unk_1000DD298;
  v687 = &v689;
  v688 = &v693;
  sub_10007CE38((uint64_t)v684, v7, v8, v9, v10, v11, v12, v13);
  v15 = v694[3];
  do
  {
    if (!fgets((char *)v15, *((_DWORD *)v690 + 6), v14))
      goto LABEL_19;
    v15 = v694[3];
  }
  while (strncmp("Report Version:", (const char *)v15, 0xFuLL));
  v16 = strtol((const char *)(v15 + 15), 0, 0);
  if (!v16)
  {
LABEL_19:
    if (byte_1000EBD38)
    {
      v31 = *__error();
      v32 = sub_100030318();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_1000978D4();
      *__error() = v31;
    }
    if (byte_1000EBD39)
      v33 = dword_1000EB4E8 <= 3;
    else
      v33 = 0;
    if (v33)
    {
      v23 = *__error();
      v34 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: No report version. Not a spindump file?"));
      v28 = v34;
      if (v34)
      {
        v35 = (char *)CFStringGetCStringPtr(v34, 0x8000100u);
        if (v35)
        {
          v36 = 0;
        }
        else
        {
          v35 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x70620F69uLL);
          CFStringGetCString(v28, v35, 1024, 0x8000100u);
          v36 = v35;
        }
        if (qword_1000EBD40)
          v56 = (FILE *)qword_1000EBD40;
        else
          v56 = __stderrp;
        fprintf(v56, "%s\n", v35);
        if (v36)
          free(v36);
        goto LABEL_152;
      }
      v47 = sub_100030318();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        sub_1000978A8();
      if (qword_1000EBD40)
        v48 = (FILE *)qword_1000EBD40;
      else
        v48 = __stderrp;
      goto LABEL_109;
    }
    goto LABEL_39;
  }
  v17 = v16;
  if (fgets((char *)v694[3], *((_DWORD *)v690 + 6), v14)
    && !strncmp("Report Variant:   condensed", (const char *)v694[3], 0x1BuLL))
  {
    if (byte_1000EBD38)
    {
      v57 = *__error();
      v58 = sub_100030318();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        sub_100097ED4();
      *__error() = v57;
    }
    v654 = 1;
    if (byte_1000EBD39 && dword_1000EB4E8 <= 0)
    {
      v59 = *__error();
      v60 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Detected condensed report variant"));
      v61 = v60;
      if (v60)
      {
        v62 = (char *)CFStringGetCStringPtr(v60, 0x8000100u);
        if (v62)
        {
          v63 = 0;
        }
        else
        {
          v62 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x45530C98uLL);
          CFStringGetCString(v61, v62, 1024, 0x8000100u);
          v63 = v62;
        }
        if (qword_1000EBD40)
          v90 = (FILE *)qword_1000EBD40;
        else
          v90 = __stderrp;
        fprintf(v90, "%s\n", v62);
        if (v63)
          free(v63);
        CFRelease(v61);
      }
      else
      {
        v87 = sub_100030318();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT))
          sub_100097EA8();
        if (qword_1000EBD40)
          v88 = (FILE *)qword_1000EBD40;
        else
          v88 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v88);
      }
      *__error() = v59;
      v654 = 1;
    }
  }
  else
  {
    v654 = 0;
  }
  if (fseek(v14, 0, 0))
  {
    if (byte_1000EBD38)
    {
      v18 = *__error();
      v19 = sub_100030318();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __error();
        v20 = __error();
        strerror(*v20);
        sub_100097E70();
      }
      *__error() = v18;
    }
    v21 = 0;
    v22 = 0;
    if (byte_1000EBD39)
    {
      obj = 0;
      v657 = 0;
      if (dword_1000EB4E8 > 3)
        goto LABEL_807;
      v23 = *__error();
      v24 = *__error();
      v25 = __error();
      v26 = strerror(*v25);
      v27 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text requires a seekable file: %d (%s)"), v24, v26);
      v28 = v27;
      if (v27)
      {
        v29 = (char *)CFStringGetCStringPtr(v27, 0x8000100u);
        if (v29)
        {
          v30 = 0;
        }
        else
        {
          v29 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x71ECD36EuLL);
          CFStringGetCString(v28, v29, 1024, 0x8000100u);
          v30 = v29;
        }
        if (qword_1000EBD40)
          v83 = (FILE *)qword_1000EBD40;
        else
          v83 = __stderrp;
        fprintf(v83, "%s\n", v29);
        if (v30)
          free(v30);
LABEL_152:
        CFRelease(v28);
        goto LABEL_153;
      }
      v74 = sub_100030318();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
      {
        __error();
        v75 = __error();
        strerror(*v75);
        sub_100097E38();
      }
      if (qword_1000EBD40)
        v48 = (FILE *)qword_1000EBD40;
      else
        v48 = __stderrp;
      goto LABEL_109;
    }
    goto LABEL_787;
  }
  if (v17 <= 19)
  {
    if (byte_1000EBD38)
    {
      v49 = *__error();
      v50 = sub_100030318();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        sub_10009792C();
      *__error() = v49;
    }
    v21 = 0;
    v22 = 0;
    if (byte_1000EBD39)
    {
      obj = 0;
      v657 = 0;
      if (dword_1000EB4E8 > 3)
        goto LABEL_807;
      v23 = *__error();
      v51 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Unable to parse text of the report: spindump report version 20+ required"));
      v28 = v51;
      if (v51)
      {
        v52 = (char *)CFStringGetCStringPtr(v51, 0x8000100u);
        if (v52)
        {
          v53 = 0;
        }
        else
        {
          v52 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC1DBFDE7uLL);
          CFStringGetCString(v28, v52, 1024, 0x8000100u);
          v53 = v52;
        }
        if (qword_1000EBD40)
          v91 = (FILE *)qword_1000EBD40;
        else
          v91 = __stderrp;
        fprintf(v91, "%s\n", v52);
        if (v53)
          free(v53);
        goto LABEL_152;
      }
      v89 = sub_100030318();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
        sub_100097900();
      if (qword_1000EBD40)
        v48 = (FILE *)qword_1000EBD40;
      else
        v48 = __stderrp;
LABEL_109:
      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v48);
LABEL_153:
      v65 = __error();
LABEL_806:
      v22 = 0;
      obj = 0;
      v657 = 0;
      v21 = 0;
      *v65 = v23;
      goto LABEL_807;
    }
LABEL_787:
    obj = 0;
    v657 = 0;
    goto LABEL_807;
  }
  if (v654)
    v66 = CFSTR("^(?<indentCount>\\d+)(?<kernelDot>\\*)?\\s+(?<count>\\d+)\\s+(?:(?<binaryIndex>\\d+)\\s+\\+\\s+(?<offsetIntoBinary>\\d+)|\\?\\?\\?)$");
  else
    v66 = CFSTR("^(?<indentWhitespace> +(?<kernelDot>\\*)?)(?<countAndWhitespace>(?<count>\\d+)\\s+)(?:\\?\\?\\?(?:\\s+\\+\\s+(?<offsetIntoUnknownSymbol>\\d+))?|(?<symbolName>.*?)\\s+\\+\\s+(?<offsetIntoSymbol>\\d+))(?:\\s+\\((?:(?<sourceFilepath>.+?)(?::(?<sourceLineNumber>\\d+)(?:[:\\.,](?<sourceColumnNumber>\\d+))?)?\\s+in\\s+)?(?:<(?<binaryUuid>[\\dabcdef\\-]{32,36})>|(?<binaryName>.+?))\\s+\\+\\s+(?<offsetIntoBinary>\\d+)\\))?(?:\\s+\\[(?<address>(?:0x)?[\\dabcdef]+)\\])?(?:\\s+\\((?<stateInfo>.+?)\\))?(?:\\s+(?<startIndex>\\d+)(?:\\s*-\\s*(?<endIndex>\\d+))?)?$");
  v697 = 0;
  v67 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", v66, 1, &v697);
  if (!v67)
  {
    if (byte_1000EBD38)
    {
      v456 = *__error();
      v457 = sub_100030318();
      if (os_log_type_enabled(v457, OS_LOG_TYPE_ERROR))
      {
        -[__CFString UTF8String](v66, "UTF8String");
        objc_msgSend(objc_msgSend(v697, "debugDescription"), "UTF8String");
        sub_10009799C();
      }
      *__error() = v456;
    }
    if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
    {
      v406 = *__error();
      v407 = -[__CFString UTF8String](v66, "UTF8String");
      v408 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: Unable to compile regex %s: %s"), "regex", v407, objc_msgSend(objc_msgSend(v697, "debugDescription"), "UTF8String"));
      v409 = v408;
      if (v408)
      {
        v555 = (char *)CFStringGetCStringPtr(v408, 0x8000100u);
        if (v555)
        {
          v556 = 0;
        }
        else
        {
          v555 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x6AE34780uLL);
          CFStringGetCString(v409, v555, 1024, 0x8000100u);
          v556 = v555;
        }
        if (qword_1000EBD40)
          v569 = (FILE *)qword_1000EBD40;
        else
          v569 = __stderrp;
        fprintf(v569, "%s\n", v555);
        if (v556)
          free(v556);
        CFRelease(v409);
      }
      else
      {
        v410 = sub_100030318();
        if (os_log_type_enabled(v410, OS_LOG_TYPE_FAULT))
        {
          -[__CFString UTF8String](v66, "UTF8String");
          objc_msgSend(objc_msgSend(v697, "debugDescription"), "UTF8String");
          sub_100097958();
        }
        if (qword_1000EBD40)
          v411 = (FILE *)qword_1000EBD40;
        else
          v411 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v411);
      }
      *__error() = v406;
    }
    -[__CFString UTF8String](v66, "UTF8String");
    objc_msgSend(objc_msgSend(v697, "debugDescription"), "UTF8String");
    sub_1000301F0("CallTreeFrameLineRegex", "SPTextualReportParser.m", 1858, "%s: Unable to compile regex %s: %s", v570, v571, v572, v573, (char)"regex");
LABEL_1042:
    abort();
  }
  v643 = v67;
  if (v654)
    v68 = CFSTR("^(?<indentCount>\\d+)(?<kernelDot>\\*)?\\s+(?<count>\\d+)\\s+(?:state\\s+(?<stateInfo>(?:0x)?[\\dabcdef]+)|<(?<angleBracketContents>.*)>|(?<otherInfo>[^<\\s\\d].*))$");
  else
    v68 = CFSTR("^(?<indentWhitespace> +(?<kernelDot>\\*)?)(?<countAndWhitespace>(?<count>\\d+)\\s+)?<(?<angleBracketContents>.*)>(?:\\s+\\((?<stateInfo>.+?)\\))?(?:\\s+(?<startIndex>\\d+)(?:\\s*-\\s*(?<endIndex>\\d+))?)?$");
  v697 = 0;
  v69 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", v68, 1, &v697);
  if (!v69)
  {
    if (byte_1000EBD38)
    {
      v458 = *__error();
      v459 = sub_100030318();
      if (os_log_type_enabled(v459, OS_LOG_TYPE_ERROR))
        sub_100097A28((uint64_t)-[__CFString UTF8String](v68, "UTF8String"), buf);
      *__error() = v458;
    }
    if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
    {
      v412 = *__error();
      v413 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: Unable to compile regex %s"), "regex", -[__CFString UTF8String](v68, "UTF8String"));
      v414 = v413;
      if (v413)
      {
        v522 = (char *)CFStringGetCStringPtr(v413, 0x8000100u);
        if (v522)
        {
          v523 = 0;
        }
        else
        {
          v522 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x75FE5649uLL);
          CFStringGetCString(v414, v522, 1024, 0x8000100u);
          v523 = v522;
        }
        if (qword_1000EBD40)
          v546 = (FILE *)qword_1000EBD40;
        else
          v546 = __stderrp;
        fprintf(v546, "%s\n", v522);
        if (v523)
          free(v523);
        CFRelease(v414);
      }
      else
      {
        v415 = sub_100030318();
        if (os_log_type_enabled(v415, OS_LOG_TYPE_FAULT))
          sub_1000979E8((uint64_t)-[__CFString UTF8String](v68, "UTF8String"), v702);
        if (qword_1000EBD40)
          v416 = (FILE *)qword_1000EBD40;
        else
          v416 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v416);
      }
      *__error() = v412;
    }
    -[__CFString UTF8String](v68, "UTF8String");
    v551 = 1921;
    v552 = "CallTreeNonFrameLineRegex";
    goto LABEL_1041;
  }
  v621 = v69;
  if (v654)
    v70 = CFSTR("^(?<binaryIndex>\\d+)\\t(?<kernelDot>\\*)?(?<bundleIdentifier>\\S+)?\\t(?<version>.+?)?\\t<(?<binaryUuid>[\\dabcdef\\-]{32,36})>\\t(?<segmentName>\\S+?)?\\t(?<binaryPath>.+?)?$");
  else
    v70 = CFSTR("^\\s*(?<kernelDot>\\*)?(?:(?<startAddress>(?:0x)?[\\dabcdef]+)|\\?\\?\\?)\\s*\\-\\s*(?:(?<endAddress>(?:0x)?[\\dabcdef]+)|\\?\\?\\?)\\s*(?:\\?\\?\\?|(?<bundleIdentifier>\\S+\\.\\S+\\.\\S+)|(?<name>.+?\\b))\\s+(?<version>(?:\\d[\\S]*?)?(?:\\s*\\(\\S+?\\)))?\\s*<(?<binaryUuid>[\\dabcdef\\-]{32,36})>(?<segmentName>\\S+?)?(?:\\s+(?<binaryPath>.+?)?)?$");
  v697 = 0;
  v71 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", v70, 1, &v697);
  if (!v71)
  {
    if (byte_1000EBD38)
    {
      v460 = *__error();
      v461 = sub_100030318();
      if (os_log_type_enabled(v461, OS_LOG_TYPE_ERROR))
        sub_100097A28((uint64_t)-[__CFString UTF8String](v70, "UTF8String"), buf);
      *__error() = v460;
    }
    if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
    {
      v417 = *__error();
      v418 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: Unable to compile regex %s"), "regex", -[__CFString UTF8String](v70, "UTF8String"));
      v419 = v418;
      if (v418)
      {
        v524 = (char *)CFStringGetCStringPtr(v418, 0x8000100u);
        if (v524)
        {
          v525 = 0;
        }
        else
        {
          v524 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xA6D8E0EuLL);
          CFStringGetCString(v419, v524, 1024, 0x8000100u);
          v525 = v524;
        }
        if (qword_1000EBD40)
          v553 = (FILE *)qword_1000EBD40;
        else
          v553 = __stderrp;
        fprintf(v553, "%s\n", v524);
        if (v525)
          free(v525);
        CFRelease(v419);
      }
      else
      {
        v420 = sub_100030318();
        if (os_log_type_enabled(v420, OS_LOG_TYPE_FAULT))
          sub_1000979E8((uint64_t)-[__CFString UTF8String](v70, "UTF8String"), v702);
        if (qword_1000EBD40)
          v421 = (FILE *)qword_1000EBD40;
        else
          v421 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v421);
      }
      *__error() = v417;
    }
    -[__CFString UTF8String](v70, "UTF8String");
    v551 = 2000;
    v552 = "LoadInfoLineRegex";
    goto LABEL_1041;
  }
  v618 = v71;
  v697 = 0;
  v72 = objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", CFSTR("^UUID:(?<whitespace>\\s*)(?:<?(?<binaryUuid>[\\dabcdef\\-]{32,36})>?|(?<binaryIndex>\\d+))$"), 1, &v697);
  if (!v72)
  {
    if (byte_1000EBD38)
    {
      v462 = *__error();
      v463 = sub_100030318();
      if (os_log_type_enabled(v463, OS_LOG_TYPE_ERROR))
        sub_100097A28((uint64_t)objc_msgSend(CFSTR("^UUID:(?<whitespace>\\s*)(?:<?(?<binaryUuid>[\\dabcdef\\-]{32,36})>?|(?<binaryIndex>\\d+))$"), "UTF8String"), buf);
      *__error() = v462;
    }
    if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
    {
      v422 = *__error();
      v423 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: Unable to compile regex %s"), "regex", objc_msgSend(CFSTR("^UUID:(?<whitespace>\\s*)(?:<?(?<binaryUuid>[\\dabcdef\\-]{32,36})>?|(?<binaryIndex>\\d+))$"), "UTF8String"));
      v424 = v423;
      if (v423)
      {
        v526 = (char *)CFStringGetCStringPtr(v423, 0x8000100u);
        if (v526)
        {
          v527 = 0;
        }
        else
        {
          v526 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x84B472E2uLL);
          CFStringGetCString(v424, v526, 1024, 0x8000100u);
          v527 = v526;
        }
        if (qword_1000EBD40)
          v554 = (FILE *)qword_1000EBD40;
        else
          v554 = __stderrp;
        fprintf(v554, "%s\n", v526);
        if (v527)
          free(v527);
        CFRelease(v424);
      }
      else
      {
        v425 = sub_100030318();
        if (os_log_type_enabled(v425, OS_LOG_TYPE_FAULT))
          sub_1000979E8((uint64_t)objc_msgSend(CFSTR("^UUID:(?<whitespace>\\s*)(?:<?(?<binaryUuid>[\\dabcdef\\-]{32,36})>?|(?<binaryIndex>\\d+))$"), "UTF8String"), v702);
        if (qword_1000EBD40)
          v426 = (FILE *)qword_1000EBD40;
        else
          v426 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v426);
      }
      *__error() = v422;
    }
    objc_msgSend(CFSTR("^UUID:(?<whitespace>\\s*)(?:<?(?<binaryUuid>[\\dabcdef\\-]{32,36})>?|(?<binaryIndex>\\d+))$"), "UTF8String");
    v551 = 2026;
    v552 = "UUIDLineRegex";
LABEL_1041:
    sub_1000301F0(v552, "SPTextualReportParser.m", v551, "%s: Unable to compile regex %s", v547, v548, v549, v550, (char)"regex");
    goto LABEL_1042;
  }
  v612 = v72;
  v683 = 0;
  if (v654)
  {
    v681 = 2;
    v682 = 2;
    v73 = 1;
    v683 = 1;
  }
  else
  {
    v681 = -1;
    v682 = -1;
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_100082BB4;
    *(_QWORD *)&buf[24] = &unk_1000DDE70;
    *(_QWORD *)&buf[32] = v643;
    *(_QWORD *)&buf[40] = &v683;
    *(_QWORD *)&buf[48] = &v681;
    v704 = &v682;
    sub_10007FC6C(v14, 0, (uint64_t)buf);
    if (v681 <= 0)
    {
      if (byte_1000EBD38)
      {
        v76 = *__error();
        v77 = sub_100030318();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Parsing spindump text: Unable to detect initial indentation, using 2", buf, 2u);
        }
        *__error() = v76;
      }
      if (byte_1000EBD39 && dword_1000EB4E8 <= 1)
      {
        v78 = *__error();
        v79 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Unable to detect initial indentation, using 2"));
        v80 = v79;
        if (v79)
        {
          v81 = (char *)CFStringGetCStringPtr(v79, 0x8000100u);
          if (v81)
          {
            v82 = 0;
          }
          else
          {
            v81 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x1C6D0C18uLL);
            CFStringGetCString(v80, v81, 1024, 0x8000100u);
            v82 = v81;
          }
          if (qword_1000EBD40)
            v97 = (FILE *)qword_1000EBD40;
          else
            v97 = __stderrp;
          fprintf(v97, "%s\n", v81);
          if (v82)
            free(v82);
          CFRelease(v80);
        }
        else
        {
          v95 = sub_100030318();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
            sub_100097E0C();
          if (qword_1000EBD40)
            v96 = (FILE *)qword_1000EBD40;
          else
            v96 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v96);
        }
        *__error() = v78;
      }
      v681 = 2;
    }
    if (v682 <= 0)
    {
      if (byte_1000EBD38)
      {
        v98 = *__error();
        v99 = sub_100030318();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "Parsing spindump text: Unable to detect incremental indentation, using 2", buf, 2u);
        }
        *__error() = v98;
      }
      if (byte_1000EBD39 && dword_1000EB4E8 <= 1)
      {
        v100 = *__error();
        v101 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Unable to detect incremental indentation, using 2"));
        v102 = v101;
        if (v101)
        {
          v103 = (char *)CFStringGetCStringPtr(v101, 0x8000100u);
          if (v103)
          {
            v104 = 0;
          }
          else
          {
            v103 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD40EDE75uLL);
            CFStringGetCString(v102, v103, 1024, 0x8000100u);
            v104 = v103;
          }
          if (qword_1000EBD40)
            v107 = (FILE *)qword_1000EBD40;
          else
            v107 = __stderrp;
          fprintf(v107, "%s\n", v103);
          if (v104)
            free(v104);
          CFRelease(v102);
        }
        else
        {
          v105 = sub_100030318();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
            sub_100097DE0();
          if (qword_1000EBD40)
            v106 = (FILE *)qword_1000EBD40;
          else
            v106 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v106);
        }
        *__error() = v100;
      }
      v682 = 2;
    }
    v73 = v683;
  }
  if (!self->_isHeavy && v73)
  {
    if (byte_1000EBD38)
    {
      v108 = *__error();
      v109 = sub_100030318();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        sub_100097DB4();
      *__error() = v108;
    }
    v21 = 0;
    v22 = 0;
    if (!byte_1000EBD39)
      goto LABEL_787;
    obj = 0;
    v657 = 0;
    if (dword_1000EB4E8 > 3)
      goto LABEL_807;
    v23 = *__error();
    v110 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Original report is not in timeline mode, so unable to output timeline mode"));
    v111 = v110;
    if (v110)
    {
      v112 = (char *)CFStringGetCStringPtr(v110, 0x8000100u);
      if (v112)
      {
        v113 = 0;
      }
      else
      {
        v112 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xF4434604uLL);
        CFStringGetCString(v111, v112, 1024, 0x8000100u);
        v113 = v112;
      }
      if (qword_1000EBD40)
        v129 = (FILE *)qword_1000EBD40;
      else
        v129 = __stderrp;
      fprintf(v129, "%s\n", v112);
      if (v113)
        free(v113);
LABEL_804:
      CFRelease(v111);
      goto LABEL_805;
    }
    v127 = sub_100030318();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_FAULT))
      sub_100097D88();
    if (qword_1000EBD40)
      v128 = (FILE *)qword_1000EBD40;
    else
      v128 = __stderrp;
    goto LABEL_246;
  }
  startIndex = self->_startIndex;
  if (v73)
  {
    if (startIndex || self->_endIndex)
    {
      if (byte_1000EBD38)
      {
        v115 = *__error();
        v116 = sub_100030318();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          sub_100097D5C();
        *__error() = v115;
      }
      v21 = 0;
      v22 = 0;
      if (!byte_1000EBD39)
        goto LABEL_787;
      obj = 0;
      v657 = 0;
      if (dword_1000EB4E8 > 3)
        goto LABEL_807;
      v23 = *__error();
      v117 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Original report is not in timeline mode, so unable to filter to start/end indexes"));
      v111 = v117;
      if (v117)
      {
        v118 = (char *)CFStringGetCStringPtr(v117, 0x8000100u);
        if (v118)
        {
          v119 = 0;
        }
        else
        {
          v118 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x1BB86C60uLL);
          CFStringGetCString(v111, v118, 1024, 0x8000100u);
          v119 = v118;
        }
        if (qword_1000EBD40)
          v133 = (FILE *)qword_1000EBD40;
        else
          v133 = __stderrp;
        fprintf(v133, "%s\n", v118);
        if (v119)
          free(v119);
        goto LABEL_804;
      }
      v130 = sub_100030318();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_FAULT))
        sub_100097D30();
      if (qword_1000EBD40)
        v128 = (FILE *)qword_1000EBD40;
      else
        v128 = __stderrp;
LABEL_246:
      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v128);
LABEL_805:
      v65 = __error();
      goto LABEL_806;
    }
  }
  else if (startIndex)
  {
LABEL_220:
    if (byte_1000EBD38)
    {
      v120 = *__error();
      v121 = sub_100030318();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "Parsing spindump text: Stacks will be filtered to the sample index range specified, but process and thread summary information and timestamps will still reflect full time range", buf, 2u);
      }
      *__error() = v120;
    }
    if (byte_1000EBD39 && dword_1000EB4E8 <= 2)
    {
      v122 = *__error();
      v123 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Stacks will be filtered to the sample index range specified, but process and thread summary information and timestamps will still reflect full time range"));
      v124 = v123;
      if (v123)
      {
        v125 = (char *)CFStringGetCStringPtr(v123, 0x8000100u);
        if (v125)
        {
          v126 = 0;
        }
        else
        {
          v125 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC528CE99uLL);
          CFStringGetCString(v124, v125, 1024, 0x8000100u);
          v126 = v125;
        }
        if (qword_1000EBD40)
          v134 = (FILE *)qword_1000EBD40;
        else
          v134 = __stderrp;
        fprintf(v134, "%s\n", v125);
        if (v126)
          free(v126);
        CFRelease(v124);
      }
      else
      {
        v131 = sub_100030318();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_FAULT))
          sub_100097D04();
        if (qword_1000EBD40)
          v132 = (FILE *)qword_1000EBD40;
        else
          v132 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v132);
      }
      *__error() = v122;
    }
    goto LABEL_268;
  }
  if (self->_endIndex)
    goto LABEL_220;
LABEL_268:
  if (self->_symbolicate)
  {
    if (byte_1000EBD38)
    {
      v135 = *__error();
      v136 = sub_100030318();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "Parsing spindump text: Symbolicating...", buf, 2u);
      }
      *__error() = v135;
    }
    if (byte_1000EBD39 && dword_1000EB4E8 <= 2)
    {
      v137 = *__error();
      v138 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Symbolicating..."));
      v139 = v138;
      if (v138)
      {
        v140 = (char *)CFStringGetCStringPtr(v138, 0x8000100u);
        if (v140)
        {
          v141 = 0;
        }
        else
        {
          v140 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xC898E2B0uLL);
          CFStringGetCString(v139, v140, 1024, 0x8000100u);
          v141 = v140;
        }
        if (qword_1000EBD40)
          v144 = (FILE *)qword_1000EBD40;
        else
          v144 = __stderrp;
        fprintf(v144, "%s\n", v140);
        if (v141)
          free(v141);
        CFRelease(v139);
      }
      else
      {
        v142 = sub_100030318();
        if (os_log_type_enabled(v142, OS_LOG_TYPE_FAULT))
          sub_100097CD8();
        if (qword_1000EBD40)
          v143 = (FILE *)qword_1000EBD40;
        else
          v143 = __stderrp;
        fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v143);
      }
      *__error() = v137;
    }
    sub_10007D28C(v14, (uint64_t)v643, (uint64_t)v618, v654, self->_useDsymForUUIDForEverything, (uint64_t)self->_findDsymsForIDs);
  }
  v657 = sub_10007D464(v14, 0, (uint64_t)v618, v654);
  if (!v657)
  {
    if (byte_1000EBD38)
    {
      v397 = *__error();
      v398 = sub_100030318();
      if (os_log_type_enabled(v398, OS_LOG_TYPE_ERROR))
        sub_100097A94();
      *__error() = v397;
    }
    v21 = 0;
    v22 = 0;
    if (!byte_1000EBD39)
      goto LABEL_787;
    obj = 0;
    v657 = 0;
    if (dword_1000EB4E8 > 3)
      goto LABEL_807;
    v23 = *__error();
    v399 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Unable to find any Binary Images"));
    v111 = v399;
    if (v399)
    {
      v400 = (char *)CFStringGetCStringPtr(v399, 0x8000100u);
      if (v400)
      {
        v401 = 0;
      }
      else
      {
        v400 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x13A7FEE7uLL);
        CFStringGetCString(v111, v400, 1024, 0x8000100u);
        v401 = v400;
      }
      if (qword_1000EBD40)
        v403 = (FILE *)qword_1000EBD40;
      else
        v403 = __stderrp;
      fprintf(v403, "%s\n", v400);
      if (v401)
        free(v401);
      goto LABEL_804;
    }
    v402 = sub_100030318();
    if (os_log_type_enabled(v402, OS_LOG_TYPE_FAULT))
      sub_100097A68();
    if (qword_1000EBD40)
      v128 = (FILE *)qword_1000EBD40;
    else
      v128 = __stderrp;
    goto LABEL_246;
  }
  if (fgets((char *)v694[3], *((_DWORD *)v690 + 6), v14))
  {
    obj = 0;
    v22 = 0;
    v622 = 0;
    LODWORD(v642) = 0;
    v611 = 0;
    v638 = 0;
    v619 = 0;
    v610 = 0;
    Weak = 0;
    v616 = -1;
    v617 = v6;
    v640 = 0xFFFFFFFFLL;
    v645 = a4;
    while (1)
    {
      context = objc_autoreleasePoolPush();
      v145 = (const char *)v694[3];
      v153 = strnlen(v145, *((int *)v690 + 6));
      if (v145[v153 - 1] != 10)
      {
        v685((uint64_t)v684, v146, v147, v148, v149, v150, v151, v152);
        goto LABEL_303;
      }
      v145[v153 - 1] = 0;
      v154 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v694[3]);
      v155 = objc_msgSend(v643, "firstMatchInString:options:range:", v154, 0, 0, -[NSString length](v154, "length"));
      v642 = (v642 + 1);
      if (v155)
        break;
      v162 = objc_msgSend(v621, "firstMatchInString:options:range:", v154, 0, 0, -[NSString length](v154, "length"));
      if (!v162)
      {
        if (objc_msgSend(v618, "firstMatchInString:options:range:", v154, 0, 0, -[NSString length](v154, "length")))
          goto LABEL_521;
        v199 = objc_msgSend(v612, "firstMatchInString:options:range:", v154, 0, 0, -[NSString length](v154, "length"));
        v200 = v199;
        if (v199)
        {
          v202 = objc_msgSend(v199, "rangeWithName:", CFSTR("binaryIndex"));
          if (v202 == (id)0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_349;
          v290 = sub_10007F0B0(-[NSString substringWithRange:](v154, "substringWithRange:", v202, v201));
          if (v290 >= (unint64_t)objc_msgSend(v657, "count"))
          {
            if (byte_1000EBD38)
            {
              v298 = v154;
              v299 = *__error();
              v300 = sub_100030318();
              if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
              {
                v395 = objc_msgSend(v657, "count");
                *(_DWORD *)buf = 134218754;
                *(_QWORD *)&buf[4] = v290;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v395;
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = v642;
                *(_WORD *)&buf[28] = 2112;
                *(_QWORD *)&buf[30] = v298;
                _os_log_error_impl((void *)&_mh_execute_header, v300, OS_LOG_TYPE_ERROR, "Parsing spindump text: corrupt condensed file, UUID line has out-of-bounds binary index %lu (%lu binaries) (%d: %@)", buf, 0x26u);
                v6 = v617;
                a4 = v645;
              }
              *__error() = v299;
              v154 = v298;
            }
            if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
            {
              v301 = v154;
              v302 = *__error();
              v303 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: corrupt condensed file, UUID line has out-of-bounds binary index %lu (%lu binaries) (%d: %@)"), v290, objc_msgSend(v657, "count"), v642, v301);
              v304 = v303;
              if (v303)
              {
                v305 = (char *)CFStringGetCStringPtr(v303, 0x8000100u);
                if (v305)
                {
                  v306 = 0;
                }
                else
                {
                  v305 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x29ECCD1AuLL);
                  CFStringGetCString(v304, v305, 1024, 0x8000100u);
                  v306 = v305;
                }
                if (qword_1000EBD40)
                  v355 = (FILE *)qword_1000EBD40;
                else
                  v355 = __stderrp;
                fprintf(v355, "%s\n", v305);
                if (v306)
                  free(v306);
                CFRelease(v304);
              }
              else
              {
                v348 = sub_100030318();
                if (os_log_type_enabled(v348, OS_LOG_TYPE_FAULT))
                {
                  v396 = objc_msgSend(v657, "count");
                  *(_DWORD *)buf = 134218754;
                  *(_QWORD *)&buf[4] = v290;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = v396;
                  *(_WORD *)&buf[22] = 1024;
                  *(_DWORD *)&buf[24] = v642;
                  *(_WORD *)&buf[28] = 2112;
                  *(_QWORD *)&buf[30] = v301;
                  _os_log_fault_impl((void *)&_mh_execute_header, v348, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: corrupt condensed file, UUID line has out-of-bounds binary index %lu (%lu binaries) (%d: %@)", buf, 0x26u);
                }
                if (qword_1000EBD40)
                  v349 = (FILE *)qword_1000EBD40;
                else
                  v349 = __stderrp;
                fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v349);
              }
              *__error() = v302;
              v6 = v617;
              a4 = v645;
            }
LABEL_349:
            fprintf(a4, "%s\n");
          }
          else
          {
            v291 = objc_msgSend(v657, "objectAtIndexedSubscript:", v290);
            objc_msgSend(v200, "rangeWithName:", CFSTR("whitespace"));
            if (v291)
              v292 = (void *)v291[5];
            else
              v292 = 0;
            objc_msgSend(objc_msgSend(objc_msgSend(v292, "uuid"), "UUIDString"), "UTF8String");
            fprintf(a4, "UUID:%*s%s\n");
          }
LABEL_521:
          v153 = 0;
LABEL_303:
          v161 = 5;
          goto LABEL_583;
        }
        if (self->_isHeavy != v683 && obj)
        {
          if (-[NSString length](v154, "length"))
          {
            if (byte_1000EBD38)
            {
              v281 = v154;
              v282 = *__error();
              v283 = sub_100030318();
              if (os_log_type_enabled(v283, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v642;
                *(_WORD *)&buf[8] = 2112;
                *(_QWORD *)&buf[10] = v281;
                _os_log_error_impl((void *)&_mh_execute_header, v283, OS_LOG_TYPE_ERROR, "Parsing spindump text: Unexpected line in call tree, ignoring (%d: %@)", buf, 0x12u);
              }
              v6 = v617;
              *__error() = v282;
              v154 = v281;
            }
            v153 = 0;
            v161 = 5;
            if (!byte_1000EBD39 || dword_1000EB4E8 > 3)
              goto LABEL_583;
            v284 = v154;
            v285 = *__error();
            v286 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Unexpected line in call tree, ignoring (%d: %@)"), v642, v284);
            v287 = v286;
            if (v286)
            {
              v288 = (char *)CFStringGetCStringPtr(v286, 0x8000100u);
              if (v288)
              {
                v289 = 0;
              }
              else
              {
                v288 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9288DD13uLL);
                CFStringGetCString(v287, v288, 1024, 0x8000100u);
                v289 = v288;
              }
              if (qword_1000EBD40)
                v394 = (FILE *)qword_1000EBD40;
              else
                v394 = __stderrp;
              fprintf(v394, "%s\n", v288);
              if (v289)
                free(v289);
              CFRelease(v287);
            }
            else
            {
              v353 = sub_100030318();
              if (os_log_type_enabled(v353, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v642;
                *(_WORD *)&buf[8] = 2112;
                *(_QWORD *)&buf[10] = v284;
                _os_log_fault_impl((void *)&_mh_execute_header, v353, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Unexpected line in call tree, ignoring (%d: %@)", buf, 0x12u);
              }
              if (qword_1000EBD40)
                v354 = (FILE *)qword_1000EBD40;
              else
                v354 = __stderrp;
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v354);
            }
            v153 = 0;
            *__error() = v285;
            goto LABEL_773;
          }
          v632 = v154;
          v311 = objc_alloc_init((Class)NSMutableArray);
          objc_msgSend(obj, "sortUsingComparator:", &stru_1000DDD10);
          objc_msgSend(v311, "addObject:", obj);
          v628 = v311;
          v312 = objc_msgSend(obj, "objectAtIndex:", 0);
          if (v312)
            v313 = v312[3];
          else
            v313 = 0;
          v622 = 0;
          v652 = vcvtpd_s64_f64(log10((double)v313)) + 2;
          v314 = self;
          v315 = v311;
          do
          {
            while (1)
            {
LABEL_590:
              if (!objc_msgSend(v315, "count"))
              {

                obj = 0;
                v6 = v617;
                a4 = v645;
                v154 = v632;
                goto LABEL_621;
              }
              v316 = objc_msgSend(v315, "lastObject");
              if (objc_msgSend(v316, "count"))
                break;
              objc_msgSend(v315, "removeLastObject");
            }
            v317 = objc_msgSend(v316, "objectAtIndex:", 0);
            objc_msgSend(v316, "removeObjectAtIndex:", 0);
            v318 = objc_msgSend(v315, "count");
            omitFramesBelowSampleCount = v314->_omitFramesBelowSampleCount;
            if (omitFramesBelowSampleCount < 1)
              break;
            v320 = v317 ? *((_DWORD *)v317 + 3) : 0;
          }
          while (v320 < omitFramesBelowSampleCount);
          v636 = (id *)v317;
          v321 = v622;
          v322 = (unsigned int *)&v22[8 * v622 - 8];
          v323 = (8 * (int)v622) | 4;
          v620 = v318 - 1;
          while (1)
          {
            v324 = v321;
            v325 = v323;
            if ((int)v321 < 1)
              break;
            --v321;
            v326 = *v322;
            v322 -= 2;
            v323 -= 8;
            if (v326 < v318 - 1)
            {
              v623 = v325;
              v625 = v324;
              v327 = v322[3];
              goto LABEL_602;
            }
          }
          v623 = v323;
          v625 = v321;
          v327 = 0;
LABEL_602:
          if (!v317)
          {
LABEL_1087:
            if (byte_1000EBD38)
            {
              v585 = *__error();
              v586 = sub_100030318();
              if (os_log_type_enabled(v586, OS_LOG_TYPE_ERROR))
                sub_100097B00((uint64_t)objc_msgSend(objc_msgSend(v317, "debugDescription"), "UTF8String"), buf);
              *__error() = v585;
            }
            if (byte_1000EBD39)
              v575 = dword_1000EB4E8 <= 3;
            else
              v575 = 0;
            if (v575)
            {
              v587 = *__error();
              v588 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: No angle bracket contents nor state info for non-frame (%s)"), "heaviestNode.angleBracketContents || heaviestNode.stateInfo", objc_msgSend(objc_msgSend(v317, "debugDescription"), "UTF8String"));
              v589 = v588;
              if (v588)
              {
                v596 = (char *)CFStringGetCStringPtr(v588, 0x8000100u);
                if (v596)
                {
                  v597 = 0;
                }
                else
                {
                  v596 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x9FC4495uLL);
                  CFStringGetCString(v589, v596, 1024, 0x8000100u);
                  v597 = v596;
                }
                if (qword_1000EBD40)
                  v602 = (FILE *)qword_1000EBD40;
                else
                  v602 = __stderrp;
                fprintf(v602, "%s\n", v596);
                if (v597)
                  free(v597);
                CFRelease(v589);
              }
              else
              {
                v590 = sub_100030318();
                if (os_log_type_enabled(v590, OS_LOG_TYPE_FAULT))
                  sub_100097AC0((uint64_t)objc_msgSend(objc_msgSend(v317, "debugDescription"), "UTF8String"), v702);
                if (qword_1000EBD40)
                  v591 = (FILE *)qword_1000EBD40;
                else
                  v591 = __stderrp;
                fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v591);
              }
              *__error() = v587;
            }
            objc_msgSend(objc_msgSend(v636, "debugDescription"), "UTF8String");
            sub_1000301F0("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 839, "%s: No angle bracket contents nor state info for non-frame (%s)", v576, v577, v578, v579, (char)"heaviestNode.angleBracketContents || heaviestNode.stateInfo");
            abort();
          }
          v328 = (void *)*((_QWORD *)v317 + 2);
          if (v328)
          {
            v329 = 0;
            v647 = v327 + v318 - 1;
            while (1)
            {
              v330 = objc_msgSend(v328, "count");
              v331 = (void *)*((_QWORD *)v317 + 2);
              if (v329 >= (unint64_t)v330)
                break;
              v332 = objc_msgSend(v331, "objectAtIndexedSubscript:", v329);
              sub_10007F11C(v645, v681 + v682 * (v647 + v329++), *((_BYTE *)v317 + 8) & 1, *((_DWORD *)v317 + 3), v652, (const char *)objc_msgSend(v332, "UTF8String"), *((_QWORD *)v317 + 4), (const char *)objc_msgSend(*((id *)v317 + 5), "UTF8String"), 0, 0);
              v328 = (void *)*((_QWORD *)v317 + 2);
            }
            if ((unint64_t)objc_msgSend(v331, "count") > 1)
            {
              v22 = (char *)malloc_type_realloc(v22, 8 * ((int)v625 + 1), 0x100004000313F17uLL);
              *(_DWORD *)&v22[v623 - 4] = v620;
              v333 = objc_msgSend(*((id *)v317 + 2), "count");
              if ((int)v625 < 1)
                v334 = 0;
              else
                v334 = *(_DWORD *)&v22[8 * (v625 - 1) + 4];
              *(_DWORD *)&v22[v623] = v333 - 1 + v334;
              v622 = v625 + 1;
LABEL_616:
              v336 = (void *)*((_QWORD *)v317 + 6);
              v314 = self;
              v315 = v628;
              if (v336 && objc_msgSend(v636[6], "count"))
              {
                objc_msgSend(v336, "sortUsingComparator:", &stru_1000DDD10);
                objc_msgSend(v628, "addObject:", v336);
              }
              goto LABEL_590;
            }
          }
          else
          {
            v335 = (void *)*((_QWORD *)v317 + 3);
            if (!v335 && !*((_QWORD *)v317 + 5))
              goto LABEL_1087;
            sub_10007FA1C(v645, v681 + v682 * (v327 + v620), *((_BYTE *)v317 + 8) & 1, *((_DWORD *)v317 + 3), v652, (const char *)objc_msgSend(v335, "UTF8String"), (uint64_t)objc_msgSend(*((id *)v317 + 5), "UTF8String"), 0, 0);
          }
          v622 = v625;
          goto LABEL_616;
        }
LABEL_621:
        if (-[NSString length](v154, "length") && (_DWORD)v640 != -1)
        {
          if (byte_1000EBD38)
          {
            v337 = v154;
            v338 = *__error();
            v339 = sub_100030318();
            if (os_log_type_enabled(v339, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v642;
              *(_WORD *)&buf[8] = 2112;
              *(_QWORD *)&buf[10] = v337;
              _os_log_error_impl((void *)&_mh_execute_header, v339, OS_LOG_TYPE_ERROR, "Parsing spindump text: Unexpected end of call tree (%d: %@)", buf, 0x12u);
            }
            v6 = v617;
            a4 = v645;
            *__error() = v338;
            v154 = v337;
          }
          if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
          {
            v340 = v154;
            v341 = *__error();
            v342 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Unexpected end of call tree (%d: %@)"), v642, v340);
            v343 = v342;
            if (v342)
            {
              v344 = (char *)CFStringGetCStringPtr(v342, 0x8000100u);
              if (v344)
              {
                v345 = 0;
              }
              else
              {
                v344 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x1A97260DuLL);
                CFStringGetCString(v343, v344, 1024, 0x8000100u);
                v345 = v344;
              }
              if (qword_1000EBD40)
                v356 = (FILE *)qword_1000EBD40;
              else
                v356 = __stderrp;
              fprintf(v356, "%s\n", v344);
              if (v345)
                free(v345);
              CFRelease(v343);
            }
            else
            {
              v350 = sub_100030318();
              if (os_log_type_enabled(v350, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v642;
                *(_WORD *)&buf[8] = 2112;
                *(_QWORD *)&buf[10] = v340;
                _os_log_fault_impl((void *)&_mh_execute_header, v350, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Unexpected end of call tree (%d: %@)", buf, 0x12u);
              }
              if (qword_1000EBD40)
                v351 = (FILE *)qword_1000EBD40;
              else
                v351 = __stderrp;
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v351);
            }
            *__error() = v341;
            v6 = v617;
            a4 = v645;
            v154 = v340;
          }
        }
        fprintf(a4, "%s\n", (const char *)v694[3]);
        if (-[NSString containsString:](v154, "containsString:", CFSTR("Binary Images:")))
        {
          v664 = 0u;
          v665 = 0u;
          v662 = 0u;
          v663 = 0u;
          v357 = 0;
          v358 = 0;
          v359 = objc_msgSend(v657, "countByEnumeratingWithState:objects:count:", &v662, v699, 16);
          if (v359)
          {
            v360 = *(_QWORD *)v663;
            do
            {
              v361 = 0;
              do
              {
                if (*(_QWORD *)v663 != v360)
                  objc_enumerationMutation(v657);
                v362 = *(_QWORD *)(*((_QWORD *)&v662 + 1) + 8 * (_QWORD)v361);
                if (v362)
                {
                  v363 = objc_msgSend(*(id *)(v362 + 40), "bundleIdentifier");
                  if (!v363)
                    v363 = *(id *)(v362 + 8);
                }
                else
                {
                  v363 = 0;
                }
                v364 = objc_msgSend(v363, "length");
                v365 = (int)v364;
                if (!v364)
                {
                  if (v362)
                  {
                    v366 = objc_msgSend(*(id *)(v362 + 40), "name");
                    if (!v366)
                      v366 = *(id *)(v362 + 16);
                  }
                  else
                  {
                    v366 = 0;
                  }
                  v367 = objc_msgSend(v366, "length");
                  if (v367)
                    v365 = (int)v367;
                  else
                    v365 = 3;
                }
                v368 = sub_100076680(v362);
                if (objc_msgSend(v368, "length"))
                  v365 += objc_msgSend(v368, "length") + 1;
                if (v362)
                  v369 = *(void **)(v362 + 48);
                else
                  v369 = 0;
                v370 = objc_msgSend(v369, "length");
                if ((int)v357 <= v365)
                  v357 = v365;
                else
                  v357 = v357;
                if (v358 <= v370)
                  v358 = v370;
                v361 = (char *)v361 + 1;
              }
              while (v359 != v361);
              v371 = objc_msgSend(v657, "countByEnumeratingWithState:objects:count:", &v662, v699, 16);
              v359 = v371;
            }
            while (v371);
          }
          v660 = 0u;
          v661 = 0u;
          v658 = 0u;
          v659 = 0u;
          v648 = objc_msgSend(v657, "countByEnumeratingWithState:objects:count:", &v658, v698, 16);
          if (v648)
          {
            v653 = 0;
            v372 = *(_QWORD *)v659;
            v626 = *(_QWORD *)v659;
            while (1)
            {
              if (v372 != v626)
                objc_enumerationMutation(v657);
              v373 = *(_QWORD *)(*((_QWORD *)&v658 + 1) + 8 * (_QWORD)v653);
              if (v373)
              {
                v374 = *(_BYTE *)(v373 + 32);
                v375 = *(_QWORD *)(v373 + 56);
                v376 = *(_QWORD *)(v373 + 64);
                v377 = objc_msgSend(*(id *)(v373 + 40), "bundleIdentifier");
                v629 = v374 & 1;
                if (!v377)
                  v377 = *(id *)(v373 + 8);
              }
              else
              {
                v376 = 0;
                v629 = 0;
                v375 = 0;
                v377 = 0;
              }
              v641 = (const char *)objc_msgSend(v377, "UTF8String");
              if (v373)
              {
                v378 = objc_msgSend(*(id *)(v373 + 40), "name");
                if (!v378)
                  v378 = *(id *)(v373 + 16);
              }
              else
              {
                v378 = 0;
              }
              v637 = (const char *)objc_msgSend(v378, "UTF8String");
              v633 = (const char *)objc_msgSend(sub_100076680(v373), "UTF8String");
              if (v373)
                v379 = *(void **)(v373 + 40);
              else
                v379 = 0;
              v380 = (const char *)objc_msgSend(objc_msgSend(objc_msgSend(v379, "uuid"), "UUIDString"), "UTF8String");
              if (v373)
                v381 = *(void **)(v373 + 48);
              else
                v381 = 0;
              v382 = (const char *)objc_msgSend(v381, "UTF8String");
              if (v373)
                v383 = *(void **)(v373 + 40);
              else
                v383 = 0;
              v384 = (const char *)objc_msgSend(objc_msgSend(v383, "path"), "UTF8String");
              if (v375)
              {
                v385 = "";
                if (v629)
                  v385 = "*";
                snprintf(buf, 0x20uLL, "%s0x%llx", v385, v375);
                v386 = v645;
                fprintf(v645, "%22s - ", buf);
                if (v376)
                  fprintf(v645, "%#18llx  ");
                else
                  fwrite("               ???  ", 0x14uLL, 1uLL, v645);
              }
              else
              {
                v386 = v645;
                fprintf(v645, "%2s");
              }
              v387 = "???";
              if (v637)
                v387 = v637;
              if (v641)
                v387 = v641;
              v392 = fprintf(v386, "%s", v387);
              if (v633)
                v392 = (fprintf(v386, " %s", v633) + v392);
              if ((int)v392 > (int)v357)
              {
                if (byte_1000EBD38)
                {
                  v505 = *__error();
                  v506 = sub_100030318();
                  if (os_log_type_enabled(v506, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316418;
                    *(_QWORD *)&buf[4] = "numChars < nameAndVersionWidth + 1";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v392;
                    *(_WORD *)&buf[18] = 1024;
                    *(_DWORD *)&buf[20] = v357;
                    *(_WORD *)&buf[24] = 2080;
                    *(_QWORD *)&buf[26] = v641;
                    *(_WORD *)&buf[34] = 2080;
                    *(_QWORD *)&buf[36] = v637;
                    *(_WORD *)&buf[44] = 2080;
                    *(_QWORD *)&buf[46] = v633;
                    _os_log_error_impl((void *)&_mh_execute_header, v506, OS_LOG_TYPE_ERROR, "%s: Printed %d characters when max is %d: %s, %s, %s", buf, 0x36u);
                  }
                  *__error() = v505;
                }
                if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
                {
                  v492 = *__error();
                  v493 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: Printed %d characters when max is %d: %s, %s, %s"), "numChars < nameAndVersionWidth + 1", v392, v357, v641, v637, v633);
                  v494 = v493;
                  if (v493)
                  {
                    v544 = (char *)CFStringGetCStringPtr(v493, 0x8000100u);
                    if (v544)
                    {
                      v545 = 0;
                    }
                    else
                    {
                      v544 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x2EB7B429uLL);
                      CFStringGetCString(v494, v544, 1024, 0x8000100u);
                      v545 = v544;
                    }
                    if (qword_1000EBD40)
                      v568 = (FILE *)qword_1000EBD40;
                    else
                      v568 = __stderrp;
                    fprintf(v568, "%s\n", v544);
                    if (v545)
                      free(v545);
                    CFRelease(v494);
                  }
                  else
                  {
                    v495 = sub_100030318();
                    if (os_log_type_enabled(v495, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 136316418;
                      *(_QWORD *)&buf[4] = "numChars < nameAndVersionWidth + 1";
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = v392;
                      *(_WORD *)&buf[18] = 1024;
                      *(_DWORD *)&buf[20] = v357;
                      *(_WORD *)&buf[24] = 2080;
                      *(_QWORD *)&buf[26] = v641;
                      *(_WORD *)&buf[34] = 2080;
                      *(_QWORD *)&buf[36] = v637;
                      *(_WORD *)&buf[44] = 2080;
                      *(_QWORD *)&buf[46] = v633;
                      _os_log_fault_impl((void *)&_mh_execute_header, v495, OS_LOG_TYPE_FAULT, "Unable to format: %s: Printed %d characters when max is %d: %s, %s, %s", buf, 0x36u);
                    }
                    if (qword_1000EBD40)
                      v496 = (FILE *)qword_1000EBD40;
                    else
                      v496 = __stderrp;
                    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v496);
                  }
                  *__error() = v492;
                }
                sub_1000301F0("PrintLoadInfoLine", "SPTextualReportParser.m", 2436, "%s: Printed %d characters when max is %d: %s, %s, %s", v388, v389, v390, v391, (char)"numChars < nameAndVersionWidth + 1");
                abort();
              }
              fprintf(v645, "%*s", v357 + 1 - v392, ");
              fprintf(v645, "<%s>", v380);
              if (v382)
                v393 = fprintf(v645, "%s", v382);
              else
                v393 = 0;
              if (v358 > v393)
                fprintf(v645, "%*s", v358 - v393, ");
              if (v384)
                fprintf(v645, "  %s", v384);
              fputc(10, v645);
              v653 = (char *)v653 + 1;
              if (v653 >= v648)
              {
                v648 = objc_msgSend(v657, "countByEnumeratingWithState:objects:count:", &v658, v698, 16);
                if (!v648)
                  break;
                v653 = 0;
              }
              v372 = *(_QWORD *)v659;
            }
          }
          if ((v654 & 1) == 0)
          {

            v657 = sub_10007D464(v14, v642, (uint64_t)v618, 0);
          }
          Weak = 0;
          v610 = 0;
          v619 = 0;
          v153 = 0;
          v161 = 0;
          v640 = 0xFFFFFFFFLL;
LABEL_773:
          v6 = v617;
          goto LABEL_583;
        }
        Weak = 0;
        v610 = 0;
        v619 = 0;
        v153 = 0;
        v161 = 0;
        v297 = 0xFFFFFFFFLL;
LABEL_549:
        v640 = v297;
        goto LABEL_583;
      }
      v676 = -1;
      v675 = -1;
      v674 = 0;
      v673 = 0;
      v672 = 0;
      v697 = 0;
      v671 = 0;
      v670 = 0;
      sub_10007F228(v154, v642, v162, v654, v681, v682, &v676, &v675, &v674, &v673, &v672, &v697, &v671, (int *)&v670 + 1, &v670);
      v163 = v697;
      v164 = v697;
      v165 = v671;
      v166 = v671;
      v167 = v673;
      if (v673 <= 0)
      {
        if (v619 < 1 || (v203 = v675, v675 <= v681 + v619))
        {
          v172 = 0;
          v171 = 0;
          v676 = 0;
        }
        else
        {
          v172 = ((v675 - (v681 + v619)) / v682);
          v676 = v172;
          if ((v172 & 0x80000000) != 0)
          {
            if (byte_1000EBD38)
            {
              v631 = v154;
              v204 = *__error();
              v205 = sub_100030318();
              if (os_log_type_enabled(v205, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)&buf[4] = v172;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v203;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = v642;
                *(_WORD *)&buf[20] = 2112;
                *(_QWORD *)&buf[22] = v631;
                _os_log_debug_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_DEBUG, "Parsing spindump text: Bad indent level %d for %d whitespace (%d: %@)", buf, 0x1Eu);
              }
              *__error() = v204;
              v154 = v631;
            }
            if (byte_1000EBD39 && dword_1000EB4E8 <= 0)
            {
              v650 = *__error();
              v206 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Bad indent level %d for %d whitespace (%d: %@)"), v172, v203, v642, v154);
              if (v206)
              {
                v207 = v206;
                v208 = (char *)CFStringGetCStringPtr(v206, 0x8000100u);
                if (v208)
                {
                  v209 = 0;
                  v6 = v617;
                }
                else
                {
                  v6 = v617;
                  v208 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xAFD8015BuLL);
                  CFStringGetCString(v207, v208, 1024, 0x8000100u);
                  v209 = v208;
                }
                if (qword_1000EBD40)
                  v352 = (FILE *)qword_1000EBD40;
                else
                  v352 = __stderrp;
                fprintf(v352, "%s\n", v208);
                if (v209)
                  free(v209);
                CFRelease(v207);
              }
              else
              {
                v346 = sub_100030318();
                if (os_log_type_enabled(v346, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)&buf[4] = v172;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v203;
                  *(_WORD *)&buf[14] = 1024;
                  *(_DWORD *)&buf[16] = v642;
                  *(_WORD *)&buf[20] = 2112;
                  *(_QWORD *)&buf[22] = v154;
                  _os_log_fault_impl((void *)&_mh_execute_header, v346, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Bad indent level %d for %d whitespace (%d: %@)", buf, 0x1Eu);
                }
                if (qword_1000EBD40)
                  v347 = (FILE *)qword_1000EBD40;
                else
                  v347 = __stderrp;
                fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v347);
                v6 = v617;
              }
              *__error() = v650;
            }
            v172 = 0;
            v676 = 0;
          }
          if (v638)
            goto LABEL_397;
          v171 = 1;
          if ((v172 & 0x80000000) != 0)
          {
LABEL_952:
            v497 = v154;
            if (byte_1000EBD38)
            {
              v507 = *__error();
              v508 = sub_100030318();
              if (os_log_type_enabled(v508, OS_LOG_TYPE_ERROR))
              {
                -[NSString UTF8String](v154, "UTF8String");
                sub_100097B84();
              }
              *__error() = v507;
            }
            if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
            {
              v498 = *__error();
              v499 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: Non-frame line has count but no indent level (%d: %s)"), "rawIndentLevel >= 0", v642, -[NSString UTF8String](v154, "UTF8String"));
              v500 = v499;
              if (v499)
              {
                v559 = (char *)CFStringGetCStringPtr(v499, 0x8000100u);
                if (v559)
                {
                  v560 = 0;
                }
                else
                {
                  v559 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xA28225B0uLL);
                  CFStringGetCString(v500, v559, 1024, 0x8000100u);
                  v560 = v559;
                }
                if (qword_1000EBD40)
                  v580 = (FILE *)qword_1000EBD40;
                else
                  v580 = __stderrp;
                fprintf(v580, "%s\n", v559);
                if (v560)
                  free(v560);
                CFRelease(v500);
              }
              else
              {
                v501 = sub_100030318();
                if (os_log_type_enabled(v501, OS_LOG_TYPE_FAULT))
                {
                  -[NSString UTF8String](v497, "UTF8String");
                  sub_100097B40();
                }
                if (qword_1000EBD40)
                  v502 = (FILE *)qword_1000EBD40;
                else
                  v502 = __stderrp;
                fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v502);
              }
              *__error() = v498;
            }
            -[NSString UTF8String](v497, "UTF8String");
            sub_1000301F0("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 659, "%s: Non-frame line has count but no indent level (%d: %s)", v581, v582, v583, v584, (char)"rawIndentLevel >= 0");
            abort();
          }
        }
      }
      else
      {
        v168 = HIDWORD(v670);
        if (HIDWORD(v670))
        {
          v169 = self->_startIndex;
          if (v169)
          {
            if (SHIDWORD(v670) < v169)
            {
              v167 = HIDWORD(v670) + v673 - v169;
              v673 = v167;
              HIDWORD(v670) = v169;
              v168 = v169;
            }
          }
        }
        if ((_DWORD)v670)
        {
          endIndex = self->_endIndex;
          if (endIndex)
          {
            if (endIndex < (int)v670)
            {
              v167 += endIndex - v670;
              v673 = v167;
              LODWORD(v670) = endIndex;
            }
          }
        }
        if (v167 < 1)
        {
          if (v168)
          {
            v250 = self->_endIndex;
            if (v250)
              v223 = v168 <= v250;
            else
              v223 = 1;
            goto LABEL_393;
          }
LABEL_397:
          v161 = 5;
LABEL_498:
          v153 = 0;
          goto LABEL_583;
        }
        v171 = 1;
        v172 = v676;
        if ((v676 & 0x80000000) != 0)
          goto LABEL_952;
      }
      if (v171 && (int)v172 > (int)v640 && (_DWORD)v172 != (_DWORD)v640 + 1)
      {
        if (byte_1000EBD38)
        {
          v240 = v154;
          v241 = *__error();
          v242 = sub_100030318();
          if (os_log_type_enabled(v242, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v642;
            *(_WORD *)&buf[8] = 2112;
            *(_QWORD *)&buf[10] = v240;
            _os_log_error_impl((void *)&_mh_execute_header, v242, OS_LOG_TYPE_ERROR, "Parsing spindump text: Unexpected indent for line (%d: %@)", buf, 0x12u);
          }
          *__error() = v241;
          v154 = v240;
        }
        v161 = 2;
        if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
        {
          v243 = v154;
          v244 = *__error();
          v245 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Unexpected indent for line (%d: %@)"), v642, v243);
          v246 = v245;
          if (v245)
          {
            v247 = (char *)CFStringGetCStringPtr(v245, 0x8000100u);
            if (v247)
            {
              v248 = 0;
            }
            else
            {
              v247 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5203F2D3uLL);
              CFStringGetCString(v246, v247, 1024, 0x8000100u);
              v248 = v247;
            }
            if (qword_1000EBD40)
              v309 = (FILE *)qword_1000EBD40;
            else
              v309 = __stderrp;
            fprintf(v309, "%s\n", v247);
            if (v248)
              free(v248);
            CFRelease(v246);
          }
          else
          {
            v307 = sub_100030318();
            if (os_log_type_enabled(v307, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v642;
              *(_WORD *)&buf[8] = 2112;
              *(_QWORD *)&buf[10] = v243;
              _os_log_fault_impl((void *)&_mh_execute_header, v307, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Unexpected indent for line (%d: %@)", buf, 0x12u);
            }
            if (qword_1000EBD40)
              v308 = (FILE *)qword_1000EBD40;
            else
              v308 = __stderrp;
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v308);
          }
          *__error() = v244;
          v161 = 2;
        }
        goto LABEL_498;
      }
      if (v167 < 1)
      {
        v249 = v619;
      }
      else
      {
        v249 = v619;
        if (v619 <= 0)
        {
          v249 = v672;
          if (v672 <= 0)
            v249 = vcvtpd_s64_f64(log10((double)v167)) + 2;
        }
      }
      v619 = v249;
      if (!v171)
      {
        if ((self->_isHeavy != v683) | v610 & 1)
        {
          v258 = v622;
          goto LABEL_579;
        }
        v651 = 0;
        v635 = 0;
        v260 = 0;
        goto LABEL_481;
      }
      v651 = v171;
      v256 = v154;
      v257 = &v22[8 * v622 + 4];
      while (1)
      {
        v258 = v622;
        v33 = (int)v622 < 1;
        v622 = (v622 - 1);
        if (v33)
          break;
        v259 = *((_DWORD *)v257 - 3);
        v257 -= 8;
        if (v259 < v172)
        {
          v260 = *(_DWORD *)v257;
          goto LABEL_470;
        }
      }
      v260 = 0;
LABEL_470:
      if (!((self->_isHeavy != v683) | v610 & 1))
      {
        v635 = v619;
        v622 = v258;
LABEL_481:
        v262 = v682;
        v263 = v681;
        v264 = v674;
        v265 = (const char *)objc_msgSend(v163, "UTF8String");
        v266 = objc_msgSend(v165, "UTF8String");
        sub_10007FA1C(v645, v263 + (v260 + v172) * v262, v264, v167, v635, v265, (uint64_t)v266, SHIDWORD(v670), v670);
        v258 = v622;
        v6 = v617;
        v171 = v651;
        goto LABEL_579;
      }
      if (!(_DWORD)v172)
      {
        if (!obj)
        {
          obj = objc_alloc_init((Class)NSMutableArray);
          v171 = v651;
          goto LABEL_576;
        }
        v668 = 0u;
        v669 = 0u;
        v666 = 0u;
        v667 = 0u;
        v294 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v666, v700, 16);
        if (!v294)
          goto LABEL_545;
        v295 = *(_QWORD *)v667;
        while (1)
        {
          for (i = 0; i != v294; i = (char *)i + 1)
          {
            if (*(_QWORD *)v667 != v295)
              objc_enumerationMutation(obj);
            Weak = *(id **)(*((_QWORD *)&v666 + 1) + 8 * (_QWORD)i);
            if ((sub_100076234((uint64_t)Weak, v674, 0, -1, (uint64_t)v671, (uint64_t)v697) & 1) != 0)
            {
              v171 = v651;
              if (Weak)
                goto LABEL_578;
LABEL_576:
              Weak = sub_100075BF0((uint64_t)SPTreeNode, 0, v674, 0, (void *)0xFFFFFFFFFFFFFFFFLL, v671, v697);
              objc_msgSend(obj, "addObject:", Weak);
              goto LABEL_577;
            }
          }
          v294 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v666, v700, 16);
          if (!v294)
          {
LABEL_545:
            v171 = v651;
            goto LABEL_576;
          }
        }
      }
      if (!Weak)
      {
        if (byte_1000EBD38)
        {
          v528 = *__error();
          v529 = sub_100030318();
          if (os_log_type_enabled(v529, OS_LOG_TYPE_ERROR))
          {
            v530 = -[NSString UTF8String](v256, "UTF8String");
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "previousNode";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v172;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v642;
            *(_WORD *)&buf[24] = 2080;
            *(_QWORD *)&buf[26] = v530;
            _os_log_error_impl((void *)&_mh_execute_header, v529, OS_LOG_TYPE_ERROR, "%s: no previousNode for indent of %d (%d: %s)", buf, 0x22u);
          }
          *__error() = v528;
        }
        if (byte_1000EBD39)
          v531 = dword_1000EB4E8 <= 3;
        else
          v531 = 0;
        if (v531)
        {
          v532 = *__error();
          v533 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: no previousNode for indent of %d (%d: %s)"), "previousNode", v172, v642, -[NSString UTF8String](v256, "UTF8String"));
          v534 = v533;
          if (v533)
          {
            v606 = (char *)CFStringGetCStringPtr(v533, 0x8000100u);
            if (v606)
            {
              v607 = 0;
            }
            else
            {
              v606 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x5CDEA7A4uLL);
              CFStringGetCString(v534, v606, 1024, 0x8000100u);
              v607 = v606;
            }
            if (qword_1000EBD40)
              v609 = (FILE *)qword_1000EBD40;
            else
              v609 = __stderrp;
            fprintf(v609, "%s\n", v606);
            if (v607)
              free(v607);
            CFRelease(v534);
          }
          else
          {
            v535 = sub_100030318();
            if (os_log_type_enabled(v535, OS_LOG_TYPE_FAULT))
            {
              v536 = -[NSString UTF8String](v256, "UTF8String");
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "previousNode";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v172;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v642;
              *(_WORD *)&buf[24] = 2080;
              *(_QWORD *)&buf[26] = v536;
              _os_log_fault_impl((void *)&_mh_execute_header, v535, OS_LOG_TYPE_FAULT, "Unable to format: %s: no previousNode for indent of %d (%d: %s)", buf, 0x22u);
            }
            if (qword_1000EBD40)
              v537 = (FILE *)qword_1000EBD40;
            else
              v537 = __stderrp;
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v537);
          }
          *__error() = v532;
        }
        -[NSString UTF8String](v256, "UTF8String");
        sub_1000301F0("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 716, "%s: no previousNode for indent of %d (%d: %s)", v538, v539, v540, v541, (char)"previousNode");
LABEL_941:
        abort();
      }
      if ((int)v640 < (int)v172)
        goto LABEL_478;
      do
      {
        Weak = (id *)objc_loadWeak(Weak + 7);
        if (!Weak)
        {
          if (byte_1000EBD38)
          {
            v476 = *__error();
            v477 = sub_100030318();
            if (os_log_type_enabled(v477, OS_LOG_TYPE_ERROR))
            {
              v478 = v676;
              v479 = -[NSString UTF8String](v256, "UTF8String");
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = "previousNode";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v478;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v640;
              *(_WORD *)&buf[24] = 1024;
              *(_DWORD *)&buf[26] = v642;
              *(_WORD *)&buf[30] = 2080;
              *(_QWORD *)&buf[32] = v479;
              _os_log_error_impl((void *)&_mh_execute_header, v477, OS_LOG_TYPE_ERROR, "%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", buf, 0x28u);
            }
            *__error() = v476;
          }
          if (byte_1000EBD39)
            v480 = dword_1000EB4E8 < 4;
          else
            v480 = 0;
          if (v480)
          {
            v481 = *__error();
            v482 = v676;
            v483 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)"), "previousNode", v676, v640, v642, -[NSString UTF8String](v256, "UTF8String"));
            v484 = v483;
            if (v483)
            {
              v599 = (char *)CFStringGetCStringPtr(v483, 0x8000100u);
              if (v599)
              {
                v600 = 0;
              }
              else
              {
                v599 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xBD2080EBuLL);
                CFStringGetCString(v484, v599, 1024, 0x8000100u);
                v600 = v599;
              }
              if (qword_1000EBD40)
                v603 = (FILE *)qword_1000EBD40;
              else
                v603 = __stderrp;
              fprintf(v603, "%s\n", v599);
              if (v600)
                free(v600);
              CFRelease(v484);
            }
            else
            {
              v485 = sub_100030318();
              if (os_log_type_enabled(v485, OS_LOG_TYPE_FAULT))
              {
                v486 = -[NSString UTF8String](v256, "UTF8String");
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = "previousNode";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v482;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = v640;
                *(_WORD *)&buf[24] = 1024;
                *(_DWORD *)&buf[26] = v642;
                *(_WORD *)&buf[30] = 2080;
                *(_QWORD *)&buf[32] = v486;
                _os_log_fault_impl((void *)&_mh_execute_header, v485, OS_LOG_TYPE_FAULT, "Unable to format: %s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", buf, 0x28u);
              }
              if (qword_1000EBD40)
                v487 = (FILE *)qword_1000EBD40;
              else
                v487 = __stderrp;
              fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v487);
            }
            *__error() = v481;
          }
          -[NSString UTF8String](v256, "UTF8String");
          sub_1000301F0("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 721, "%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", v488, v489, v490, v491, (char)"previousNode");
          goto LABEL_941;
        }
        v261 = v640 - 1;
        v33 = (int)v640 <= (int)v676;
        v640 = (v640 - 1);
      }
      while (!v33);
      v165 = v671;
      v163 = v697;
      LODWORD(v640) = v261;
LABEL_478:
      Weak = sub_1000760AC((uint64_t)Weak, v674, 0, (void *)0xFFFFFFFFFFFFFFFFLL, v165, v163);
      v171 = v651;
LABEL_577:
      if (Weak)
LABEL_578:
        *((_DWORD *)Weak + 3) += v673;
      else
        Weak = 0;
LABEL_579:
      v153 = 0;
      v161 = 0;
      if (v171)
        v310 = v676;
      else
        v310 = v640;
      v640 = v310;
      v622 = v258;
LABEL_583:
      objc_autoreleasePoolPop(context);
      if (v161 && v161 != 5)
        goto LABEL_40;
      a4 = v645;
      if (!fgets((char *)(v694[3] + v153), *((_DWORD *)v690 + 6) - v153, v14))
        goto LABEL_789;
    }
    LOBYTE(v671) = 0;
    LOBYTE(v676) = 0;
    v156 = sub_10007D560(v154, v155, v654, v681, v682);
    v634 = objc_msgSend(v155, "rangeWithName:", CFSTR("kernelDot"));
    v697 = (id)-1;
    v157 = sub_10007D5F4(v154, v642, v155, v657, v654, (unint64_t *)&v697);
    v158 = (unint64_t)v157;
    v627 = v156;
    v630 = v154;
    if (v616 == -1)
    {
      v160 = -1;
      v159 = (unint64_t)v611;
    }
    else
    {
      v159 = 0;
      v160 = -1;
      if (v697 == (id)v616 && v611 == v157)
      {
        v159 = (unint64_t)v611;
        LOBYTE(v676) = 1;
        v160 = v616;
      }
    }
    v174 = objc_msgSend(v155, "rangeWithName:", CFSTR("symbolName"));
    if (v174 == (id)0x7FFFFFFFFFFFFFFFLL)
      v175 = 0;
    else
      v175 = -[NSString substringWithRange:](v630, "substringWithRange:", v174, v173);
    v177 = objc_msgSend(v155, "rangeWithName:", CFSTR("offsetIntoSymbol"));
    if (v177 == (id)0x7FFFFFFFFFFFFFFFLL)
      v178 = -1;
    else
      v178 = (int)sub_10007F0B0(-[NSString substringWithRange:](v630, "substringWithRange:", v177, v176));
    v179 = v697;
    LOBYTE(v671) = 0;
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_1000829B8;
    *(_QWORD *)&buf[24] = &unk_1000DDE48;
    *(_QWORD *)&buf[32] = v643;
    *(_QWORD *)&buf[40] = v621;
    v713 = v654;
    v710 = v681;
    v711 = v682;
    v712 = v627;
    v714 = v634 != (id)0x7FFFFFFFFFFFFFFFLL;
    v707 = &v676;
    v708 = v697;
    *(_QWORD *)&buf[48] = v158;
    v704 = (int *)v657;
    v705 = v175;
    v706 = &v671;
    v709 = v178;
    sub_10007FC6C(v14, v642, (uint64_t)buf);
    v180 = v676;
    if ((_BYTE)v676)
      v181 = (uint64_t)v179;
    else
      v181 = v160;
    v616 = v181;
    if ((_BYTE)v676)
      v182 = v158;
    else
      v182 = v159;
    v611 = (id)v182;
    v183 = v671;
    v184 = objc_autoreleasePoolPush();
    v186 = objc_msgSend(v155, "rangeWithName:", CFSTR("count"));
    if (v186 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (byte_1000EBD38)
      {
        v469 = *__error();
        v470 = sub_100030318();
        if (os_log_type_enabled(v470, OS_LOG_TYPE_ERROR))
        {
          -[NSString UTF8String](v630, "UTF8String");
          sub_100097C0C();
        }
        *__error() = v469;
      }
      if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
      {
        v464 = *__error();
        v465 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: frame match with no count (%d: %s)"), "range.location != NSNotFound", v642, -[NSString UTF8String](v630, "UTF8String"));
        v466 = v465;
        if (v465)
        {
          v542 = (char *)CFStringGetCStringPtr(v465, 0x8000100u);
          if (v542)
          {
            v543 = 0;
          }
          else
          {
            v542 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x72A5D112uLL);
            CFStringGetCString(v466, v542, 1024, 0x8000100u);
            v543 = v542;
          }
          if (qword_1000EBD40)
            v561 = (FILE *)qword_1000EBD40;
          else
            v561 = __stderrp;
          fprintf(v561, "%s\n", v542);
          if (v543)
            free(v543);
          CFRelease(v466);
        }
        else
        {
          v467 = sub_100030318();
          if (os_log_type_enabled(v467, OS_LOG_TYPE_FAULT))
          {
            -[NSString UTF8String](v630, "UTF8String");
            sub_100097BC8();
          }
          if (qword_1000EBD40)
            v468 = (FILE *)qword_1000EBD40;
          else
            v468 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v468);
        }
        *__error() = v464;
      }
      -[NSString UTF8String](v630, "UTF8String", v186);
      v566 = "%s: frame match with no count (%d: %s)";
      v567 = 1553;
    }
    else
    {
      v639 = sub_10007F0B0(-[NSString substringWithRange:](v630, "substringWithRange:", v186, v185));
      if ((v654 & 1) != 0)
      {
        v649 = sub_1000822B0(v630, v155, v158, (uint64_t)v179, v183 != 0, v180 != 0);
        v187 = 0;
        v188 = 0;
        LODWORD(v158) = 0;
        v189 = 0;
        v624 = -1;
LABEL_363:
        objc_autoreleasePoolPop(v184);
        if (objc_msgSend(objc_msgSend(v649, "firstObject"), "length"))
        {
          v210 = v649;
          v211 = v188;
          if (!v683)
          {
            if ((_DWORD)v158 && (_DWORD)v189)
            {
LABEL_369:
              v212 = self->_startIndex;
              if (v212 && (int)v158 < v212)
              {
                v639 = v158 + v639 - v212;
                LODWORD(v158) = self->_startIndex;
              }
LABEL_372:
              if ((_DWORD)v189 && (v213 = self->_endIndex) != 0 && (int)v189 > v213)
              {
                v214 = v187;
                v639 = v639 - v189 + v213;
                v189 = self->_endIndex;
              }
              else
              {
                v214 = v187;
              }
              if (v639 <= 0)
              {
                v638 = v639 < 1;
                if ((_DWORD)v158)
                {
                  v222 = self->_endIndex;
                  if (v222)
                    v223 = (int)v158 <= v222;
                  else
                    v223 = 1;
LABEL_393:
                  v224 = !v223;
                  v610 |= v224;
                }
                goto LABEL_397;
              }
              if ((int)v627 > (int)v640 && (_DWORD)v627 != (_DWORD)v640 + 1)
              {
                if (byte_1000EBD38)
                {
                  v215 = *__error();
                  v216 = sub_100030318();
                  if (os_log_type_enabled(v216, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)&buf[4] = v642;
                    *(_WORD *)&buf[8] = 2112;
                    *(_QWORD *)&buf[10] = v630;
                    _os_log_error_impl((void *)&_mh_execute_header, v216, OS_LOG_TYPE_ERROR, "Parsing spindump text: Unexpected indent for line (%d: %@)", buf, 0x12u);
                  }
                  *__error() = v215;
                }
                v638 = v639 < 1;
                v161 = 2;
                if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
                {
                  v217 = *__error();
                  v218 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: Unexpected indent for line (%d: %@)"), v642, v630);
                  v219 = v218;
                  if (v218)
                  {
                    v220 = (char *)CFStringGetCStringPtr(v218, 0x8000100u);
                    if (v220)
                    {
                      v221 = 0;
                    }
                    else
                    {
                      v220 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xEE18143AuLL);
                      CFStringGetCString(v219, v220, 1024, 0x8000100u);
                      v221 = v220;
                    }
                    if (qword_1000EBD40)
                      v278 = (FILE *)qword_1000EBD40;
                    else
                      v278 = __stderrp;
                    fprintf(v278, "%s\n", v220);
                    if (v221)
                      free(v221);
                    CFRelease(v219);
                  }
                  else
                  {
                    v254 = sub_100030318();
                    if (os_log_type_enabled(v254, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)&buf[4] = v642;
                      *(_WORD *)&buf[8] = 2112;
                      *(_QWORD *)&buf[10] = v630;
                      _os_log_fault_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: Unexpected indent for line (%d: %@)", buf, 0x12u);
                    }
                    if (qword_1000EBD40)
                      v255 = (FILE *)qword_1000EBD40;
                    else
                      v255 = __stderrp;
                    fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v255);
                  }
                  *__error() = v217;
                }
                goto LABEL_498;
              }
              if (self->_isHeavy == v683)
              {
                v225 = self->_omitFramesBelowSampleCount;
                if (v225 < 1 || v639 >= v225)
                {
                  v226 = v619;
                  if (v619 <= 0)
                  {
                    v226 = v214;
                    if (v214 <= 0)
                      v226 = vcvtpd_s64_f64(log10((double)v639)) + 2;
                  }
                  v619 = v226;
                  v227 = v622;
                  v228 = (unsigned int *)&v22[8 * v622 - 8];
                  v229 = (8 * (int)v622) | 4;
                  v613 = v158;
                  v615 = v188;
                  while (1)
                  {
                    v230 = v227;
                    v231 = v229;
                    if ((int)v227 < 1)
                      break;
                    --v227;
                    v232 = *v228;
                    v228 -= 2;
                    v229 -= 8;
                    if (v232 < v627)
                    {
                      v233 = v228[3];
                      goto LABEL_483;
                    }
                  }
                  v233 = 0;
LABEL_483:
                  v267 = 0;
                  v268 = v233 + v627;
                  while (v267 < (unint64_t)objc_msgSend(v649, "count"))
                  {
                    v269 = v189;
                    v270 = objc_msgSend(v649, "objectAtIndexedSubscript:", v267);
                    v271 = v682;
                    v272 = v681;
                    v273 = (const char *)objc_msgSend(v270, "UTF8String");
                    v274 = -[NSString UTF8String](v615, "UTF8String");
                    v275 = v272 + v271 * (v268 + v267);
                    v189 = v269;
                    sub_10007F11C(v645, v275, v634 != (id)0x7FFFFFFFFFFFFFFFLL, v639, v619, v273, v624, v274, v613, v269);
                    ++v267;
                    v6 = v617;
                  }
                  if ((unint64_t)objc_msgSend(v649, "count") <= 1)
                  {
                    v622 = v230;
                  }
                  else
                  {
                    v22 = (char *)malloc_type_realloc(v22, 8 * ((int)v230 + 1), 0x100004000313F17uLL);
                    *(_DWORD *)&v22[v231 - 4] = v627;
                    v276 = objc_msgSend(v649, "count");
                    if ((int)v230 < 1)
                      v277 = 0;
                    else
                      v277 = *(_DWORD *)&v22[8 * (v230 - 1) + 4];
                    *(_DWORD *)&v22[v231] = v276 - 1 + v277;
                    v622 = v230 + 1;
                  }
                }
LABEL_548:
                v638 = 0;
                v153 = 0;
                v161 = 0;
                v297 = v627;
                goto LABEL_549;
              }
              if ((_DWORD)v627)
              {
                if (!Weak)
                {
                  if (byte_1000EBD38)
                  {
                    v509 = *__error();
                    v510 = sub_100030318();
                    if (os_log_type_enabled(v510, OS_LOG_TYPE_ERROR))
                    {
                      v511 = -[NSString UTF8String](v630, "UTF8String");
                      *(_DWORD *)buf = 136315906;
                      *(_QWORD *)&buf[4] = "previousNode";
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = v627;
                      *(_WORD *)&buf[18] = 1024;
                      *(_DWORD *)&buf[20] = v642;
                      *(_WORD *)&buf[24] = 2080;
                      *(_QWORD *)&buf[26] = v511;
                      _os_log_error_impl((void *)&_mh_execute_header, v510, OS_LOG_TYPE_ERROR, "%s: no previousNode for indent of %d (%d: %s)", buf, 0x22u);
                    }
                    *__error() = v509;
                  }
                  if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
                  {
                    v512 = *__error();
                    v513 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: no previousNode for indent of %d (%d: %s)"), "previousNode", v627, v642, -[NSString UTF8String](v630, "UTF8String"));
                    v514 = v513;
                    if (v513)
                    {
                      v604 = (char *)CFStringGetCStringPtr(v513, 0x8000100u);
                      if (v604)
                      {
                        v605 = 0;
                      }
                      else
                      {
                        v604 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xE0DFAE82uLL);
                        CFStringGetCString(v514, v604, 1024, 0x8000100u);
                        v605 = v604;
                      }
                      if (qword_1000EBD40)
                        v608 = (FILE *)qword_1000EBD40;
                      else
                        v608 = __stderrp;
                      fprintf(v608, "%s\n", v604);
                      if (v605)
                        free(v605);
                      CFRelease(v514);
                    }
                    else
                    {
                      v515 = sub_100030318();
                      if (os_log_type_enabled(v515, OS_LOG_TYPE_FAULT))
                      {
                        v516 = -[NSString UTF8String](v630, "UTF8String");
                        *(_DWORD *)buf = 136315906;
                        *(_QWORD *)&buf[4] = "previousNode";
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = v627;
                        *(_WORD *)&buf[18] = 1024;
                        *(_DWORD *)&buf[20] = v642;
                        *(_WORD *)&buf[24] = 2080;
                        *(_QWORD *)&buf[26] = v516;
                        _os_log_fault_impl((void *)&_mh_execute_header, v515, OS_LOG_TYPE_FAULT, "Unable to format: %s: no previousNode for indent of %d (%d: %s)", buf, 0x22u);
                      }
                      if (qword_1000EBD40)
                        v517 = (FILE *)qword_1000EBD40;
                      else
                        v517 = __stderrp;
                      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v517);
                    }
                    *__error() = v512;
                  }
                  -[NSString UTF8String](v630, "UTF8String");
                  sub_1000301F0("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 578, "%s: no previousNode for indent of %d (%d: %s)", v518, v519, v520, v521, (char)"previousNode");
                  goto LABEL_887;
                }
                if ((int)v640 >= (int)v627)
                {
                  while (1)
                  {
                    Weak = (id *)objc_loadWeak(Weak + 7);
                    if (!Weak)
                      break;
                    v33 = (int)v640 <= (int)v627;
                    v640 = (v640 - 1);
                    if (v33)
                      goto LABEL_423;
                  }
                  if (byte_1000EBD38)
                  {
                    v442 = *__error();
                    v443 = sub_100030318();
                    if (os_log_type_enabled(v443, OS_LOG_TYPE_ERROR))
                    {
                      v444 = -[NSString UTF8String](v630, "UTF8String");
                      *(_DWORD *)buf = 136316162;
                      *(_QWORD *)&buf[4] = "previousNode";
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = v627;
                      *(_WORD *)&buf[18] = 1024;
                      *(_DWORD *)&buf[20] = v640;
                      *(_WORD *)&buf[24] = 1024;
                      *(_DWORD *)&buf[26] = v642;
                      *(_WORD *)&buf[30] = 2080;
                      *(_QWORD *)&buf[32] = v444;
                      _os_log_error_impl((void *)&_mh_execute_header, v443, OS_LOG_TYPE_ERROR, "%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", buf, 0x28u);
                    }
                    *__error() = v442;
                  }
                  if (byte_1000EBD39)
                    v445 = dword_1000EB4E8 <= 3;
                  else
                    v445 = 0;
                  if (v445)
                  {
                    v446 = *__error();
                    v447 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)"), "previousNode", v627, v640, v642, -[NSString UTF8String](v630, "UTF8String"));
                    v448 = v447;
                    if (v447)
                    {
                      v594 = (char *)CFStringGetCStringPtr(v447, 0x8000100u);
                      if (v594)
                      {
                        v595 = 0;
                      }
                      else
                      {
                        v594 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x287E1945uLL);
                        CFStringGetCString(v448, v594, 1024, 0x8000100u);
                        v595 = v594;
                      }
                      if (qword_1000EBD40)
                        v601 = (FILE *)qword_1000EBD40;
                      else
                        v601 = __stderrp;
                      fprintf(v601, "%s\n", v594);
                      if (v595)
                        free(v595);
                      CFRelease(v448);
                    }
                    else
                    {
                      v449 = sub_100030318();
                      if (os_log_type_enabled(v449, OS_LOG_TYPE_FAULT))
                      {
                        v450 = -[NSString UTF8String](v630, "UTF8String");
                        *(_DWORD *)buf = 136316162;
                        *(_QWORD *)&buf[4] = "previousNode";
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = v627;
                        *(_WORD *)&buf[18] = 1024;
                        *(_DWORD *)&buf[20] = v640;
                        *(_WORD *)&buf[24] = 1024;
                        *(_DWORD *)&buf[26] = v642;
                        *(_WORD *)&buf[30] = 2080;
                        *(_QWORD *)&buf[32] = v450;
                        _os_log_fault_impl((void *)&_mh_execute_header, v449, OS_LOG_TYPE_FAULT, "Unable to format: %s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", buf, 0x28u);
                      }
                      if (qword_1000EBD40)
                        v451 = (FILE *)qword_1000EBD40;
                      else
                        v451 = __stderrp;
                      fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v451);
                    }
                    *__error() = v446;
                  }
                  -[NSString UTF8String](v630, "UTF8String");
                  sub_1000301F0("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 583, "%s: no previousNode for indent %d, previousIndentLevel %d (%d: %s)", v452, v453, v454, v455, (char)"previousNode");
LABEL_887:
                  abort();
                }
LABEL_423:
                Weak = sub_1000760AC((uint64_t)Weak, v634 != (id)0x7FFFFFFFFFFFFFFFLL, v649, (void *)v624, v188, 0);
              }
              else
              {
                if (obj)
                {
                  v679 = 0u;
                  v680 = 0u;
                  v677 = 0u;
                  v678 = 0u;
                  v251 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v677, v701, 16);
                  if (v251)
                  {
                    v252 = *(_QWORD *)v678;
LABEL_448:
                    v253 = 0;
                    while (1)
                    {
                      if (*(_QWORD *)v678 != v252)
                        objc_enumerationMutation(obj);
                      Weak = *(id **)(*((_QWORD *)&v677 + 1) + 8 * v253);
                      if ((sub_100076234((uint64_t)Weak, v634 != (id)0x7FFFFFFFFFFFFFFFLL, v649, v624, (uint64_t)v188, 0) & 1) != 0)break;
                      if (v251 == (id)++v253)
                      {
                        v251 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v677, v701, 16);
                        if (v251)
                          goto LABEL_448;
                        goto LABEL_525;
                      }
                    }
                    if (Weak)
                      goto LABEL_527;
                  }
                }
                else
                {
                  obj = objc_alloc_init((Class)NSMutableArray);
                }
LABEL_525:
                Weak = sub_100075BF0((uint64_t)SPTreeNode, 0, v634 != (id)0x7FFFFFFFFFFFFFFFLL, v649, (void *)v624, v188, 0);
                objc_msgSend(obj, "addObject:", Weak);
              }
              if (Weak)
LABEL_527:
                *((_DWORD *)Weak + 3) += v639;
              else
                Weak = 0;
              goto LABEL_548;
            }
            if (byte_1000EBD38)
            {
              v234 = *__error();
              v235 = sub_100030318();
              if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v642;
                *(_WORD *)&buf[8] = 2112;
                *(_QWORD *)&buf[10] = v630;
                _os_log_error_impl((void *)&_mh_execute_header, v235, OS_LOG_TYPE_ERROR, "Parsing spindump text: No start/end index for frame line in timeline report (%d: %@)", buf, 0x12u);
              }
              *__error() = v234;
            }
            if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
            {
              v614 = *__error();
              v236 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Parsing spindump text: No start/end index for frame line in timeline report (%d: %@)"), v642, v630);
              v237 = v236;
              if (v236)
              {
                v238 = (char *)CFStringGetCStringPtr(v236, 0x8000100u);
                if (v238)
                {
                  v239 = 0;
                }
                else
                {
                  v238 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xD7EA6958uLL);
                  CFStringGetCString(v237, v238, 1024, 0x8000100u);
                  v239 = v238;
                }
                if (qword_1000EBD40)
                  v293 = (FILE *)qword_1000EBD40;
                else
                  v293 = __stderrp;
                fprintf(v293, "%s\n", v238);
                if (v239)
                  free(v239);
                CFRelease(v237);
              }
              else
              {
                v279 = sub_100030318();
                if (os_log_type_enabled(v279, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v642;
                  *(_WORD *)&buf[8] = 2112;
                  *(_QWORD *)&buf[10] = v630;
                  _os_log_fault_impl((void *)&_mh_execute_header, v279, OS_LOG_TYPE_FAULT, "Unable to format: Parsing spindump text: No start/end index for frame line in timeline report (%d: %@)", buf, 0x12u);
                }
                if (qword_1000EBD40)
                  v280 = (FILE *)qword_1000EBD40;
                else
                  v280 = __stderrp;
                fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v280);
              }
              *__error() = v614;
            }
          }
          if (!(_DWORD)v158)
            goto LABEL_372;
          goto LABEL_369;
        }
        if (byte_1000EBD38)
        {
          v427 = *__error();
          v428 = sub_100030318();
          if (os_log_type_enabled(v428, OS_LOG_TYPE_ERROR))
          {
            v429 = objc_msgSend(objc_msgSend(v649, "debugDescription"), "UTF8String");
            v430 = -[NSString UTF8String](v630, "UTF8String");
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "frameBodies.firstObject.length > 0";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = v429;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = v642;
            *(_WORD *)&buf[28] = 2080;
            *(_QWORD *)&buf[30] = v430;
            _os_log_error_impl((void *)&_mh_execute_header, v428, OS_LOG_TYPE_ERROR, "%s: No frame bodies in %s (%d: %s)", buf, 0x26u);
          }
          *__error() = v427;
        }
        if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
        {
          v431 = *__error();
          v432 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: No frame bodies in %s (%d: %s)"), "frameBodies.firstObject.length > 0", objc_msgSend(objc_msgSend(v649, "debugDescription"), "UTF8String"), v642, -[NSString UTF8String](v630, "UTF8String"));
          v433 = v432;
          if (v432)
          {
            v592 = (char *)CFStringGetCStringPtr(v432, 0x8000100u);
            if (v592)
            {
              v593 = 0;
            }
            else
            {
              v592 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x15E719C8uLL);
              CFStringGetCString(v433, v592, 1024, 0x8000100u);
              v593 = v592;
            }
            if (qword_1000EBD40)
              v598 = (FILE *)qword_1000EBD40;
            else
              v598 = __stderrp;
            fprintf(v598, "%s\n", v592);
            if (v593)
              free(v593);
            CFRelease(v433);
          }
          else
          {
            v434 = sub_100030318();
            if (os_log_type_enabled(v434, OS_LOG_TYPE_FAULT))
            {
              v435 = objc_msgSend(objc_msgSend(v649, "debugDescription"), "UTF8String");
              v436 = -[NSString UTF8String](v630, "UTF8String");
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "frameBodies.firstObject.length > 0";
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = v435;
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = v642;
              *(_WORD *)&buf[28] = 2080;
              *(_QWORD *)&buf[30] = v436;
              _os_log_fault_impl((void *)&_mh_execute_header, v434, OS_LOG_TYPE_FAULT, "Unable to format: %s: No frame bodies in %s (%d: %s)", buf, 0x26u);
            }
            if (qword_1000EBD40)
              v437 = (FILE *)qword_1000EBD40;
            else
              v437 = __stderrp;
            fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v437);
          }
          *__error() = v431;
        }
        objc_msgSend(objc_msgSend(v649, "debugDescription"), "UTF8String");
        -[NSString UTF8String](v630, "UTF8String");
        sub_1000301F0("-[SPTextualReportParser parseSpindumpFile:andReportToStream:]", "SPTextualReportParser.m", 484, "%s: No frame bodies in %s (%d: %s)", v438, v439, v440, v441, (char)"frameBodies.firstObject.length > 0");
LABEL_1086:
        abort();
      }
      if (objc_msgSend(v155, "rangeWithName:", CFSTR("countAndWhitespace")) != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v187 = v190;
        v192 = objc_msgSend(v155, "rangeWithName:", CFSTR("address"));
        if (v192 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v624 = 0;
          if (v158 && v179 != (id)0x7FFFFFFFFFFFFFFFLL)
            v624 = (unint64_t)v179 + *(_QWORD *)(v158 + 56);
        }
        else
        {
          v624 = sub_10007F0B0(-[NSString substringWithRange:](v630, "substringWithRange:", v192, v191));
        }
        v649 = sub_1000822B0(v630, v155, v158, (uint64_t)v179, v183 != 0, v180 != 0);
        v194 = objc_msgSend(v155, "rangeWithName:", CFSTR("stateInfo"));
        if (v194 == (id)0x7FFFFFFFFFFFFFFFLL)
          v188 = 0;
        else
          v188 = -[NSString substringWithRange:](v630, "substringWithRange:", v194, v193);
        v196 = objc_msgSend(v155, "rangeWithName:", CFSTR("startIndex"));
        if (v196 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          LODWORD(v158) = 0;
          v189 = 0;
        }
        else
        {
          v158 = sub_10007F0B0(-[NSString substringWithRange:](v630, "substringWithRange:", v196, v195));
          v198 = objc_msgSend(v155, "rangeWithName:", CFSTR("endIndex"));
          if (v198 == (id)0x7FFFFFFFFFFFFFFFLL)
            v189 = v158;
          else
            v189 = sub_10007F0B0(-[NSString substringWithRange:](v630, "substringWithRange:", v198, v197));
        }
        goto LABEL_363;
      }
      if (byte_1000EBD38)
      {
        v503 = *__error();
        v504 = sub_100030318();
        if (os_log_type_enabled(v504, OS_LOG_TYPE_ERROR))
        {
          -[NSString UTF8String](v630, "UTF8String");
          sub_100097C94();
        }
        *__error() = v503;
      }
      if (byte_1000EBD39 && dword_1000EB4E8 <= 3)
      {
        v471 = *__error();
        v472 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s: frame match with no count and whitespace (%d: %s)"), "range.location != NSNotFound", v642, -[NSString UTF8String](v630, "UTF8String"));
        v473 = v472;
        if (v472)
        {
          v557 = (char *)CFStringGetCStringPtr(v472, 0x8000100u);
          if (v557)
          {
            v558 = 0;
          }
          else
          {
            v557 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x43C64E57uLL);
            CFStringGetCString(v473, v557, 1024, 0x8000100u);
            v558 = v557;
          }
          if (qword_1000EBD40)
            v574 = (FILE *)qword_1000EBD40;
          else
            v574 = __stderrp;
          fprintf(v574, "%s\n", v557);
          if (v558)
            free(v558);
          CFRelease(v473);
        }
        else
        {
          v474 = sub_100030318();
          if (os_log_type_enabled(v474, OS_LOG_TYPE_FAULT))
          {
            -[NSString UTF8String](v630, "UTF8String");
            sub_100097C50();
          }
          if (qword_1000EBD40)
            v475 = (FILE *)qword_1000EBD40;
          else
            v475 = __stderrp;
          fwrite("UNABLE TO FORMAT STRING\n", 0x18uLL, 1uLL, v475);
        }
        *__error() = v471;
      }
      -[NSString UTF8String](v630, "UTF8String");
      v566 = "%s: frame match with no count and whitespace (%d: %s)";
      v567 = 1557;
    }
    sub_1000301F0("ParseFrameLine", "SPTextualReportParser.m", v567, v566, v562, v563, v564, v565, (char)"range.location != NSNotFound");
    goto LABEL_1086;
  }
  v22 = 0;
  obj = 0;
LABEL_789:
  v21 = 1;
  while (fgets((char *)v694[3], *((_DWORD *)v690 + 6), v14))
    fputs((const char *)v694[3], a4);
LABEL_807:
  v404 = (void *)v694[3];
  if (v404)
    free(v404);
  if (v14)
    fclose(v14);
  if (v22)
    free(v22);

  _Block_object_dispose(&v689, 8);
  _Block_object_dispose(&v693, 8);
  objc_autoreleasePoolPop(v6);
  return v21 & 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPTextualReportParser;
  -[SPTextualReportParser dealloc](&v3, "dealloc");
}

- (BOOL)isHeavy
{
  return self->_isHeavy;
}

- (void)setIsHeavy:(BOOL)a3
{
  self->_isHeavy = a3;
}

- (int)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(int)a3
{
  self->_startIndex = a3;
}

- (int)endIndex
{
  return self->_endIndex;
}

- (void)setEndIndex:(int)a3
{
  self->_endIndex = a3;
}

- (int)omitFramesBelowSampleCount
{
  return self->_omitFramesBelowSampleCount;
}

- (void)setOmitFramesBelowSampleCount:(int)a3
{
  self->_omitFramesBelowSampleCount = a3;
}

- (BOOL)symbolicate
{
  return self->_symbolicate;
}

- (void)setSymbolicate:(BOOL)a3
{
  self->_symbolicate = a3;
}

- (BOOL)useDsymForUUIDForEverything
{
  return self->_useDsymForUUIDForEverything;
}

- (void)setUseDsymForUUIDForEverything:(BOOL)a3
{
  self->_useDsymForUUIDForEverything = a3;
}

- (NSArray)findDsymsForIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFindDsymsForIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
